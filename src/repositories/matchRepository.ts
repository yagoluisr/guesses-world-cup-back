import { QueryResult } from "pg";
import connection from "../database/db.js";
import { EndGame, Match, UpdateMatch } from "../protocols/matchs.js";


export async function alterGuessesStatus(matchId: UpdateMatch): Promise<QueryResult> {
    return connection.query(
        `UPDATE 
            matchs 
        SET 
            guesses_status = $1
        WHERE 
            id = $2`,
        [matchId.guesses_status, matchId.id]
    );
}

export async function checkMatch(match: EndGame): Promise<QueryResult<Match>> {
    return connection.query(
        `SELECT 
            *
        FROM
            matchs
        WHERE
            id = $1`
        ,[match.match_id]
    );
}

export async function finishMatch(match: EndGame): Promise<QueryResult> {
    return connection.query(
        `UPDATE
            matchs
        SET
            winner = $1,
            tied = $2
        WHERE 
            id = $3;`
        ,[match.winner, match.tied, match.match_id]
    );
}