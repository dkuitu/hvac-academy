import { Response, NextFunction } from 'express';
import { AuthenticatedRequest } from '../types';

// TODO: Implement trust score lookup from database
export async function attachTrustScore(req: AuthenticatedRequest, _res: Response, next: NextFunction) {
  if (req.userId) {
    // Placeholder — will query user trust score from DB
    req.trustScore = 1.0;
  }
  next();
}
