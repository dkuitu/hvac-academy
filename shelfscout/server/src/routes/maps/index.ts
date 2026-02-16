import { Router } from 'express';
import { authenticate } from '../../middleware/auth';
import * as mapsController from '../../controllers/maps.controller';

const router = Router();

router.get('/data', authenticate, mapsController.getMapData);
router.get('/heatmap', authenticate, mapsController.getHeatmap);

export default router;
