import { Request, Response } from 'express';
import { RegisterUserProtocol } from '../protocols/user.js';
import { hasEmail, registerUser } from '../repositories/authRepository.js';
import { registerUserSchema } from '../schemas/userSchemas.js';


export async function insertUser (req: Request, res: Response) {
    const { name, email} = req.body as RegisterUserProtocol;

    const { error } = registerUserSchema.validate({name, email});

    if(error) {
        return res.status(400).send({message: error.message})
    }

    try {
        const result = await hasEmail(email);

        if(result.rowCount > 0) return res.sendStatus(400);
        
        await registerUser({name, email});

        res.send('Ok')
    } catch (error) {
        res.status(500).send(error.message);
    }
}