import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router'
import { AddEmployeeDetailsComponent } from './employee/add-employee-details/add-employee-details.component';
import { EmployeeComponent } from './employee/employee.component';
import { EmployeeTypeComponent } from './employee/employee-type/employee-type.component';
import { AssessmentsComponent } from './assessments/assessments.component';
import { AllergyComponent } from './allergy/allergy.component';
import { AddAllergyComponent } from './allergy/add-allergy/add-allergy.component';
import { UpdateEmployeeDetailsComponent } from './employee/update-employee-details/update-employee-details.component';
import { AddAssessmentsComponent } from './assessments/add-assessments/add-assessments.component';
import { LoginComponent } from './login/login.component';
import { StudentComponent } from './student/student/student.component';
import { ParentComponent } from './parent/parent.component';
import { AddParentDetailsComponent } from './parent/add-parent-details/add-parent-details.component';
import { AddStudentDetailsComponent } from './student/add-student-details/add-student-details.component';
import { ClassTypeComponent } from './class-type/class-type.component';
import { AddClassTypeComponent } from './class-type/add-class-type/add-class-type.component';
import { UpdateStudentComponent } from './student/update-student/update-student.component';
import { UpdateParentComponent } from './parent/update-parent/update-parent.component';
import { UpdateClassTypeComponent } from './class-type/update-class-type/update-class-type.component';
import { StudentNumbersComponent } from './reports/student-numbers/student-numbers.component';
import { EmployeeReportComponent } from './reports/employee-report/employee-report.component';
import { ReportsComponent } from './reports/reports/reports.component';
import { MenuItemsReportComponent } from './reports/menu-items-report/menu-items-report.component';
import { Menu_ItemComponent } from './menu-item/menu-item.component';
import { AddMenu_ItemComponent } from './menu-item/add-menu-item/add-menu-item.component';
import { ScheduleComponent } from './schedule/schedule.component';
import { ViewScheduleComponent } from './schedule/view-schedule/view-schedule.component';
import { HelpPageComponent } from './header/help-page/help-page.component';
import { ChildPerformanceComponent } from './child-performance/child-performance.component';
import { ViewProgressComponent } from './child-performance/view-progress/view-progress.component';
import { ParentFeedbackComponent } from './child-performance/parent-feedback/parent-feedback.component';

const routes: Routes = [
  {path: 'assessmentList', component:AssessmentsComponent},
  {path: 'updateEmployee/:id', component:UpdateEmployeeDetailsComponent},
  {path: 'addAssessment', component:AddAssessmentsComponent},
  {path: 'addemployeedetails', component: AddEmployeeDetailsComponent},
  {path: 'employeeType', component: EmployeeTypeComponent},
  {path: 'allergylist', component: AllergyComponent},
  {path: 'addallergydetails', component: AddAllergyComponent},
  {path: 'login', component: LoginComponent},
  {path: 'employeelist', component: EmployeeComponent},
  {path: 'parentlist', component: ParentComponent},
  {path: 'addparentdetails', component: AddParentDetailsComponent},
  {path: 'studentlist', component: StudentComponent},
  {path: 'addstudentdetails', component: AddStudentDetailsComponent},
  {path: 'classtypelist', component: ClassTypeComponent},
  {path: 'addclasstype', component: AddClassTypeComponent},
  {path: 'updatestudent/:id', component: UpdateStudentComponent},
  {path: 'updateparent/:id', component: UpdateParentComponent},
  {path: 'updateclasstype/:id', component: UpdateClassTypeComponent},
  {path: 'updateemployee/:id', component: UpdateEmployeeDetailsComponent},
  {path: 'studentnumbers', component: StudentNumbersComponent},
  {path: 'employee', component: EmployeeReportComponent},
  {path: 'reports', component: ReportsComponent},
  {path: 'menuitems', component: MenuItemsReportComponent},
  {path: 'menu_itemlist', component: Menu_ItemComponent},
  {path: 'addmenu_item', component: AddMenu_ItemComponent},
  {path: 'schedule', component: ScheduleComponent},
  {path: 'viewSchedule', component: ViewScheduleComponent},
  {path: 'help-page', component: HelpPageComponent},
  {path: 'child-performance', component: ChildPerformanceComponent},
  {path: 'view-progress', component: ViewProgressComponent},
  {path: 'parent-feedback', component: ParentFeedbackComponent},



  {path: '', redirectTo: '/login', pathMatch: 'full'}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
export const routingComponents = [ AddEmployeeDetailsComponent,EmployeeComponent]
