import { Router } from 'express';
import authRoutes from './auth';
import submissionsRoutes from './submissions';
import storesRoutes from './stores';
import crownsRoutes from './crowns';
import leaderboardsRoutes from './leaderboards';
import validationRoutes from './validation';
import mapsRoutes from './maps';
import usersRoutes from './users';

const router = Router();

router.use('/auth', authRoutes);
router.use('/submissions', submissionsRoutes);
router.use('/stores', storesRoutes);
router.use('/crowns', crownsRoutes);
router.use('/leaderboards', leaderboardsRoutes);
router.use('/validation', validationRoutes);
router.use('/maps', mapsRoutes);
router.use('/users', usersRoutes);

export default router;
