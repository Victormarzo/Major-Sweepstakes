import { connection } from "../database/database.js";
import {QueryResult} from "pg";

async function checkGameId (id:number):Promise<QueryResult>{
    return connection.query(`
    SELECT * FROM matches WHERE id = $1
    `,[id])
}

async function checkTeam(name:string):Promise<QueryResult> {
    return connection.query(`
    SELECT id FROM teams WHERE name=$1
    `,[name])
}

async function  checkWinner(winner:number, id:number):Promise<QueryResult> {
    return connection.query(`
    SELECT * FROM matches 
    WHERE id = $1 AND 
    ("firstTeamId"=$2 
    OR 
     "secondTeamId"=$2)
    `,[id,winner])
}

async function checkStatus(id:number):Promise<QueryResult> {
    return connection.query(`
    SELECT * FROM  matches 
    WHERE id = $1
    AND status = 'On hold'
    `,[id])
}

export {checkGameId,checkTeam,checkWinner,checkStatus}