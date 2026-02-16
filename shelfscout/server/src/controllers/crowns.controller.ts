import { Request, Response } from 'express';

export async function getCrowns(_req: Request, res: Response) {
  // TODO: Implement get crowns for a region
  res.status(501).json({ error: 'Not implemented' });
}

export async function getCrownHistory(_req: Request, res: Response) {
  // TODO: Implement crown transfer history
  res.status(501).json({ error: 'Not implemented' });
}

export async function getUserCrowns(_req: Request, res: Response) {
  // TODO: Implement get crowns held by current user
  res.status(501).json({ error: 'Not implemented' });
}
