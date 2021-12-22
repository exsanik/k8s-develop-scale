import { join } from 'path';

import { NestMiddleware, Injectable } from '@nestjs/common';
import { NextFunction, Request, Response } from 'express';

@Injectable()
export class FrontendMiddleware implements NestMiddleware {
  use(req: Request, res: Response, next: NextFunction) {
    const { url } = req;
    if (url.startsWith('/api')) {
      next();
    } else {
      res.sendFile(join(__dirname, '../client/index.html'));
    }
  }
}
