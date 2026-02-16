import { Router } from 'express';
import { authenticate } from '../../middleware/auth';
import * as usersController from '../../controllers/users.controller';

const router = Router();

router.get('/profile', authenticate, usersController.getProfile);
router.put('/profile', authenticate, usersController.updateProfile);
router.get('/badges', authenticate, usersController.getBadges);
router.get('/stats', authenticate, usersController.getStats);

export default router;
