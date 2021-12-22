import { MiddlewareConsumer, Module, RequestMethod } from '@nestjs/common';

import { AppController } from './app.controller';
import { AppService } from './app.service';
import { FrontendMiddleware } from './frontend.middleware';

@Module({
  imports: [],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {
  configure(consumer: MiddlewareConsumer): void {
    consumer.apply(FrontendMiddleware).forRoutes({
      path: '/**', // For all routes
      method: RequestMethod.ALL, // For all methods
    });
  }
}
