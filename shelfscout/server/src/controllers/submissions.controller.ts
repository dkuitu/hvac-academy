import { Request, Response } from 'express';

export async function createSubmission(_req: Request, res: Response) {
  // TODO: Implement price submission creation
  res.status(501).json({ error: 'Not implemented' });
}

export async function getSubmission(_req: Request, res: Response) {
  // TODO: Implement get submission by ID
  res.status(501).json({ error: 'Not implemented' });
}

export async function getSubmissionsByStore(_req: Request, res: Response) {
  // TODO: Implement get submissions for a store
  res.status(501).json({ error: 'Not implemented' });
}

export async function getUserSubmissions(_req: Request, res: Response) {
  // TODO: Implement get submissions by current user
  res.status(501).json({ error: 'Not implemented' });
}
