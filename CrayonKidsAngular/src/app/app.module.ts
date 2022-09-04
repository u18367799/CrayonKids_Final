import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';


import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http';
import { AddEmployeeDetailsComponent } from './employee/add-employee-details/add-employee-details.component';
import { UpdateEmployeeDetailsComponent } from './employee/update-employee-details/update-employee-details.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { EmployeeComponent } from './employee/employee.component';
import { EmployeeService } from './services/employee.service';
import { EmployeeTypeComponent } from './employee/employee-type/employee-type.component';
import { AssessmentsComponent } from './assessments/assessments.component';
import { AddAssessmentsComponent } from './assessments/add-assessments/add-assessments.component';
import { AllergyComponent } from './allergy/allergy.component';
import { AddAllergyComponent } from './allergy/add-allergy/add-allergy.component';
import { LoginComponent } from './login/login.component';
//Materials
import { MatMenuModule } from '@angular/material/menu';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatTableModule } from '@angular/material/table';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatButtonModule } from '@angular/material/button';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatInputModule } from '@angular/material/input';
import { MatRadioModule } from '@angular/material/radio';
import { MatSelectModule } from '@angular/material/select';
import { MatCardModule } from '@angular/material/card';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatSliderModule } from '@angular/material/slider';
import { MatIconModule } from '@angular/material/icon';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatNativeDateModule } from '@angular/material/core';
import { LogoutComponent } from './login/logout/logout.component';
import { ClassTypeComponent } from './class-type/class-type.component';
import { ParentComponent } from './parent/parent.component';
import { CommonModule } from '@angular/common';
import { MatFormFieldModule } from '@angular/material/form-field';
import { AddParentDetailsComponent } from './parent/add-parent-details/add-parent-details.component';
import { AddStudentDetailsComponent } from './student/add-student-details/add-student-details.component';
import { StudentComponent } from './student/student/student.component';
import { AddClassTypeComponent } from './class-type/add-class-type/add-class-type.component';
import { UpdateStudentComponent } from './student/update-student/update-student.component';
import { UpdateParentComponent } from './parent/update-parent/update-parent.component';
import { UpdateClassTypeComponent } from './class-type/update-class-type/update-class-type.component';
import { StudentNumbersComponent } from './reports/student-numbers/student-numbers.component';
import { EmployeeReportComponent } from './reports/employee-report/employee-report.component';
import { ReportsComponent } from './reports/reports/reports.component';
import { Menu_ItemComponent } from './menu-item/menu-item.component';
import { AddMenu_ItemComponent } from './menu-item/add-menu-item/add-menu-item.component';
import { UpdateMenu_ItemComponent } from './menu-item/update-menu-item/update-menu-item.component';
import { MenuItemsReportComponent } from './reports/menu-items-report/menu-items-report.component';
import { SidenavComponent } from './sidenav/sidenav.component';
import { BodyComponent } from './body/body.component';
import { ScheduleComponent } from './schedule/schedule.component';
import { HeaderComponent } from './header/header.component';
import { ViewScheduleComponent } from './schedule/view-schedule/view-schedule.component';
import { HelpPageComponent } from './header/help-page/help-page.component';
import { NgxExtendedPdfViewerModule } from 'ngx-extended-pdf-viewer';
import { NgbModalModule } from '@ng-bootstrap/ng-bootstrap';
import { CalendarModule, DateAdapter } from 'angular-calendar';
import { FlatpickrModule } from 'angularx-flatpickr';
import { adapterFactory } from 'angular-calendar/date-adapters/date-fns';
import { ChildPerformanceComponent } from './child-performance/child-performance.component';
import { ViewProgressComponent } from './child-performance/view-progress/view-progress.component';
import { ParentFeedbackComponent } from './child-performance/parent-feedback/parent-feedback.component';
//import { SublevelMenuComponent } from './sidenav/sublevel-menu.component';
//import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';

@NgModule({
  declarations: [
    AppComponent,
    AddEmployeeDetailsComponent,
    EmployeeComponent,
    EmployeeTypeComponent,
    AssessmentsComponent,
    AddAssessmentsComponent,
    AllergyComponent,
    AddAllergyComponent,
    LoginComponent,
    UpdateEmployeeDetailsComponent,
    LogoutComponent,
    ClassTypeComponent,
    ParentComponent,
    AddParentDetailsComponent,
    AddStudentDetailsComponent,
    StudentComponent,
    AddClassTypeComponent,
    UpdateStudentComponent,
    UpdateParentComponent,
    UpdateClassTypeComponent,
    StudentNumbersComponent,
    EmployeeReportComponent,
    ReportsComponent,
    Menu_ItemComponent,
    AddMenu_ItemComponent,
    UpdateMenu_ItemComponent,
    MenuItemsReportComponent,
    SidenavComponent,
    BodyComponent,
    ScheduleComponent,
    HeaderComponent,
    ViewScheduleComponent,
    HelpPageComponent,
    ChildPerformanceComponent,
    ViewProgressComponent,
    ParentFeedbackComponent,

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    MatTableModule,
    BrowserAnimationsModule,
    CommonModule,
    MatCardModule,
    MatDatepickerModule,
    MatButtonModule,
    MatSliderModule,
    MatSlideToggleModule,
    MatSelectModule,
    MatRadioModule,
    MatInputModule,
    MatCheckboxModule,
    MatAutocompleteModule,
    MatIconModule,
    MatProgressSpinnerModule,
    MatExpansionModule,
    MatNativeDateModule,
    HttpClientModule,
    FormsModule,
    MatFormFieldModule,
    ReactiveFormsModule,
    MatToolbarModule,
    MatMenuModule,
    NgxExtendedPdfViewerModule,
     FlatpickrModule.forRoot(),
    CalendarModule.forRoot({ provide: DateAdapter, useFactory: adapterFactory }),
    NgbModalModule,
  ],
  exports: [
    MatInputModule,
    MatFormFieldModule,
    MatSelectModule,
],
  providers: [EmployeeService],
  bootstrap: [AppComponent],
})
export class AppModule {}
