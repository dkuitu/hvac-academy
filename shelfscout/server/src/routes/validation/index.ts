import { Router } from 'express';
import { authenticate } from '../../middleware/auth';
import * as validationController from '../../controllers/validation.controller';

const router = Router();

router.get('/queue', authenticate, validationController.getValidationQueue);
router.post('/:submissionId', authenticate, validationController.submitValidation);
router.get('/stats', authenticate, validationController.getValidationStats);

export default router;
