import connection from '../database/db.js';


export async function registerUser (name: string, email: string) {

    const result = await connection.query(
        `INSERT INTO 
            users (name, email) 
            VALUES ($1, $2);`
        ,[name, email]
    ) 

    return result.rows;
}