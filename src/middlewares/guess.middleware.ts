import { connection } from "../database/database.js";
import {QueryResult} from "pg";

async function checkGuess (id:number,name:string):Promise<QueryResult>{
    return connection.query(`
        SELECT * FROM guesses WHERE name = $1 AND "matchId" = $2
        `,[name,id])
}

async function checkUser(name:string):Promise<QueryResult> {
    return connection.query(`
        SELECT * FROM guesses WHERE name = $1 
        `,[name])
}
export {checkGuess,checkUser}