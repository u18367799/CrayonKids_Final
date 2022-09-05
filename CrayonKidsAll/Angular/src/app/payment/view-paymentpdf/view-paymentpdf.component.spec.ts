import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewPaymentpdfComponent } from './view-paymentpdf.component';

describe('ViewPaymentpdfComponent', () => {
  let component: ViewPaymentpdfComponent;
  let fixture: ComponentFixture<ViewPaymentpdfComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ViewPaymentpdfComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ViewPaymentpdfComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
