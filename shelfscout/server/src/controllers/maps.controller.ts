import { Request, Response } from 'express';

export async function getMapData(_req: Request, res: Response) {
  // TODO: Implement map data endpoint (stores + states within viewport)
  res.status(501).json({ error: 'Not implemented' });
}

export async function getHeatmap(_req: Request, res: Response) {
  // TODO: Implement activity heatmap data
  res.status(501).json({ error: 'Not implemented' });
}
