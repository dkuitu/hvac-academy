import { Request, Response } from 'express';

export async function getProfile(_req: Request, res: Response) {
  // TODO: Implement get user profile
  res.status(501).json({ error: 'Not implemented' });
}

export async function updateProfile(_req: Request, res: Response) {
  // TODO: Implement update user profile
  res.status(501).json({ error: 'Not implemented' });
}

export async function getBadges(_req: Request, res: Response) {
  // TODO: Implement get user badges
  res.status(501).json({ error: 'Not implemented' });
}

export async function getStats(_req: Request, res: Response) {
  // TODO: Implement get user stats (crown count, submissions, streaks)
  res.status(501).json({ error: 'Not implemented' });
}
