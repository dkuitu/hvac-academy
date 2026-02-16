import app from './app';
import { env } from './config/environment';
import { logger } from './utils/logger';

const PORT = env.PORT;

app.listen(PORT, () => {
  logger.info(`ShelfScout server running on port ${PORT}`);
});
