import { Controller, Get, ParseIntPipe, Query } from '@nestjs/common';
import { AppService } from './app.service';

@Controller('api')
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getRoot(@Query('number', ParseIntPipe) number: number): number[] {
    return this.appService.getFactorization(number);
  }

  @Get('health')
  getHealth() {
    return { ok: true };
  }
}
