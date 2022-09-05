import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MenuItemsReportComponent } from './menu-items-report.component';

describe('MenuItemsReportComponent', () => {
  let component: MenuItemsReportComponent;
  let fixture: ComponentFixture<MenuItemsReportComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MenuItemsReportComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MenuItemsReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
