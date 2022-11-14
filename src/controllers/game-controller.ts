import {Request,Response} from 'express';
import {returnGamelist,insertGame,updateGameWinner} from '../repositories/game-repository.js'
import { NewGame } from '../protocols/game.js';
import { newGameSchema } from '../schemas/game-schema.js';
import { checkGameId,checkTeam,checkWinner } from '../middlewares/game-middleware.js';

async function getGameList (req:Request, res:Response){
    try {
        const result = await returnGamelist()
        res.send(result.rows);
    } catch (error) {
        res.status(500).send(error.message);
    }
} 

async function insertNewGame (req:Request, res:Response){
    const newGame = req.body as NewGame;
    
    const {error} = newGameSchema.validate(newGame);
    if (error){
        return res.status(400).send({
            message:error.message
        })
    }
    try {
        await insertGame(newGame);
        res.status(200).send(`New game inserted`)
    } catch (error) {
        res.status(500).send(error.message);
    }
}

async function updateGame (req:Request, res:Response){
    const gameId = req.params.gameId as string;
    const winner = req.query.winner as string
    
    try {
        const checkMatch:number = (await checkGameId(Number(gameId))).rowCount    
        if (checkMatch === 0){
            return res.status(404).send('This match does not exist')
        }
        if (!winner){
            return res.status(400).send('Missing data')
        }
        const teamId:{id:number} = (await checkTeam(winner)).rows[0]
        if (!teamId){
            return res.status(400).send('This team does not exist')
        }
        const checkTeams:number= (await checkWinner(teamId.id,Number(gameId))).rowCount
        if (checkTeams === 0){
            return res.status(400).send('This team is not playing in this match')
        }
        await updateGameWinner(winner,Number(gameId))
        res.status(200).send(`Winner has bee updated`)
    } catch (error) {
        res.status(500).send(error.message);
    }
    

}

export {getGameList,insertNewGame,updateGame};