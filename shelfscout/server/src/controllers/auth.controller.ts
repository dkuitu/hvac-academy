import { Request, Response } from 'express';

export async function register(_req: Request, res: Response) {
  // TODO: Implement user registration
  res.status(501).json({ error: 'Not implemented' });
}

export async function login(_req: Request, res: Response) {
  // TODO: Implement user login
  res.status(501).json({ error: 'Not implemented' });
}

export async function refreshToken(_req: Request, res: Response) {
  // TODO: Implement token refresh
  res.status(501).json({ error: 'Not implemented' });
}
