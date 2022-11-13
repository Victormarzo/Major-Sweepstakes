import {Request,Response} from 'express';
import { returnRanking } from '../repositories/ranking.repository.js';

async function getRanking(req:Request, res:Response) {
    try {
        const result = await returnRanking()
        if(result.rowCount===0){
           return res.status(404).send('There is no ranking yet')
        }
        
             res.send(result.rows);
        
        
        
    } catch (error) {
        return res.status(500).send(error.message);
    }
}

export{getRanking}