import { Router } from 'express';
import { authenticate } from '../../middleware/auth';
import * as storesController from '../../controllers/stores.controller';

const router = Router();

router.get('/nearby', authenticate, storesController.getNearbyStores);
router.get('/:id', authenticate, storesController.getStore);
router.post('/suggest', authenticate, storesController.suggestStore);

export default router;
