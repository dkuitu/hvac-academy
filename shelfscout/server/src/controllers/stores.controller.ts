import { Request, Response } from 'express';

export async function getNearbyStores(_req: Request, res: Response) {
  // TODO: Implement nearby store lookup with PostGIS
  res.status(501).json({ error: 'Not implemented' });
}

export async function getStore(_req: Request, res: Response) {
  // TODO: Implement get store by ID
  res.status(501).json({ error: 'Not implemented' });
}

export async function suggestStore(_req: Request, res: Response) {
  // TODO: Implement store suggestion for admin review
  res.status(501).json({ error: 'Not implemented' });
}
