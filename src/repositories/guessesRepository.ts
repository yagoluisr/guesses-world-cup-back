import { QueryResult } from "pg";
import connection from "../database/db.js";
import { GuessEntity } from "../protocols/guesses.js";


export async function allGuesses (): Promise<QueryResult<GuessEntity>> {

    return connection.query(
        `SELECT * FROM guesses;`
    )
}