import { QueryResult } from 'pg';
import connection from '../database/db.js';
import { RegisterUserEntity, RegisterUserProtocol } from '../protocols/user.js';


export async function hasEmail(email: string): Promise<QueryResult<RegisterUserEntity>> {
    return connection.query(
        `SELECT * 
        FROM 
            users 
        WHERE 
            email = $1`
        ,[email]
    );
}

export async function registerUser ({name, email}: RegisterUserProtocol):Promise<QueryResult> {

    const result = await connection.query(
        `INSERT INTO 
            users (name, email) 
            VALUES ($1, $2);`
        ,[name, email]
    );

    return result;
}