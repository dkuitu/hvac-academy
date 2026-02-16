import { Router } from 'express';
import { authenticate } from '../../middleware/auth';
import * as leaderboardsController from '../../controllers/leaderboards.controller';

const router = Router();

router.get('/regional/:regionId', authenticate, leaderboardsController.getRegionalLeaderboard);
router.get('/national', authenticate, leaderboardsController.getNationalLeaderboard);
router.get('/weekly', authenticate, leaderboardsController.getWeeklyLeaderboard);

export default router;
