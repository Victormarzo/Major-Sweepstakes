import { connection } from "../database/database.js";
import {QueryResult} from "pg";
import { NewGuess } from "../protocols/guess.js";

async function insertGuess(guess:NewGuess):Promise<QueryResult> {
    return connection.query(`
    INSERT INTO guesses
    (name,"matchId",guess)
    VALUES ($1,$2,$3);
    `,[guess.name,guess.matchId,guess.guess])
}

async function deleteGuess(id:number,name:string):Promise<QueryResult> {
    return connection.query(`
    DELETE FROM guesses
    WHERE (name,"matchId")
    = ($1,$2);
    `,[name,id])
}

export{
    insertGuess,deleteGuess
}