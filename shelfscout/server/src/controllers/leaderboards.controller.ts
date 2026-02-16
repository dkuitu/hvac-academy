import { Request, Response } from 'express';

export async function getRegionalLeaderboard(_req: Request, res: Response) {
  // TODO: Implement regional leaderboard
  res.status(501).json({ error: 'Not implemented' });
}

export async function getNationalLeaderboard(_req: Request, res: Response) {
  // TODO: Implement national leaderboard
  res.status(501).json({ error: 'Not implemented' });
}

export async function getWeeklyLeaderboard(_req: Request, res: Response) {
  // TODO: Implement weekly leaderboard
  res.status(501).json({ error: 'Not implemented' });
}
