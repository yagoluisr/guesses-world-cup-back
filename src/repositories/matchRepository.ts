import { QueryResult } from "pg";
import connection from "../database/db.js";
import { UpdateMatch } from "../protocols/matchs.js";


export async function alterGuessesStatus(matchId: UpdateMatch): Promise<QueryResult> {
    return connection.query(
        `UPDATE 
            matchs 
        SET 
            guesses_status = $1
        WHERE 
            id = $2`,
        [matchId.guesses_status, matchId.id]
    )
}