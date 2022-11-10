import { Request, Response } from 'express';
import { registerUser } from '../repositories/authRepository.js';


export async function insertUser (req: Request, res: Response) {
    const { name, email} = req.body;

    try {
        await registerUser(name, email);
        
        res.send('Ok')
    } catch (error) {
        res.status(500).send(error);
    }
}