import connection from '../database/db.js';
import { RegisterUserProtocol } from '../protocols/user.js';


export async function registerUser ({name, email}: RegisterUserProtocol) {

    const result = await connection.query(
        `INSERT INTO 
            users (name, email) 
            VALUES ($1, $2);`
        ,[name, email]
    ) 

    return result.rows;
}