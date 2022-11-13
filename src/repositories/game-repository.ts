import { NewGame } from "../protocols/game.js"; 
import { connection } from "../database/database.js";
import {QueryResult} from "pg";

async function returnGamelist ():Promise<QueryResult<NewGame[]>>{
    return connection.query(`
    SELECT 
        matches.id, t1.name as team1, t2.name as team2, 
        matches.status,matches.winner, maps.name as map
    FROM matches 
    JOIN teams t1 ON "firstTeamId"=t1.id
    JOIN teams t2 ON "secondTeamId"=t2.id
    JOIN maps on "mapId"=maps.id
    
    `)
} 

async function insertGame (game:NewGame): Promise<QueryResult>{
   return  connection.query(`
    INSERT INTO matches 
    ("firstTeamId","secondTeamId","mapId")
    VALUES ($1,$2,$3);
    `,[game.firstTeamId,game.secondTeamId,game.mapId])
}

async function updateGameWinner (winner:string,id:number): Promise<QueryResult> {
    return connection.query(`
    UPDATE matches 
    SET (status,winner) = 
    ('Finished',$1)
    WHERE id = $2     
    `,[winner,id])
}

export{
    returnGamelist,insertGame,updateGameWinner
}
