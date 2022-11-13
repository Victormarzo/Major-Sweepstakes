import { connection } from "../database/database.js";
import {QueryResult} from "pg";
import { Rank } from "../protocols/rank.js";
async function returnRanking():Promise<QueryResult<Rank[]>> {
    return connection.query(`
    SELECT COUNT(guesses.id) AS "rigthGuesses",
        guesses.name
        FROM guesses, matches
	    WHERE matches.winner=guesses.guess
        AND matches.id=guesses."matchId"
    GROUP BY guesses.name
    ORDER BY "rigthGuesses" DESC
    
    `)
}

export {returnRanking}