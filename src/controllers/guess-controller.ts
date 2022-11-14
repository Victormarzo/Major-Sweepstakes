import {Request,Response} from 'express';
import { checkGameId,checkStatus,checkTeam ,checkWinner} from '../middlewares/game-middleware.js';
import { checkGuess,checkUser } from '../middlewares/guess.middleware.js';
import { NewGuess } from '../protocols/guess.js';
import { insertGuess,deleteGuess } from '../repositories/guess-repository.js';
import { newGuessSchema } from '../schemas/guess-schema.js';

async function insertNewGuess (req:Request, res:Response){
    const newGuess:NewGuess = req.body 
    const {error} = newGuessSchema.validate(newGuess);
    if (error){
        return res.status(400).send({
            message:error.message
        })
    }
    try {
        const checkMatch:number = (await checkGameId(Number(newGuess.matchId))).rowCount    
        if (checkMatch === 0){
            return res.status(404).send('This match does not exist')
        }
        const teamId:{id:number} = (await checkTeam(newGuess.guess)).rows[0]
        if (!teamId){
            return res.status(400).send('This team does not exist')
        }
        const checkTeams:number= (await checkWinner(teamId.id,Number(newGuess.matchId))).rowCount
        if (checkTeams === 0){
            return res.status(400).send('This team is not playing in this match')
        }
        const repeated:number = (await checkGuess(Number(newGuess.matchId),newGuess.name)).rowCount
        if (repeated !== 0){
            return res.status(409).send('This user already has a guess for this match')
        }
        const isFinished:number = (await checkStatus(Number(newGuess.matchId))).rowCount
        if (isFinished === 0){
            res.status(403).send('This match is already finished')
        }

        await insertGuess(newGuess);
        res.status(200).send(`New guess inserted`)

    } catch (error) {
        res.status(500).send(error.message);
    }
}

async function deleteUserGuess(req:Request, res:Response) {
    const gameId = req.query.gameId as string
    const name = req.query.name as string
    try {
        const check :number = (await checkGuess(Number(gameId),name)).rowCount
        const checkName :number = (await checkUser(name)).rowCount
        if (check === 0 || checkName === 0){
            return res.status(409).send('This user does not have a guess for this match')
        }
        await deleteGuess(Number(gameId),name);
        res.status(200).send(`A guess has been deleted`)
    } catch (error) {
        res.status(500).send(error.message);
    }
    

}



export {insertNewGuess,deleteUserGuess}