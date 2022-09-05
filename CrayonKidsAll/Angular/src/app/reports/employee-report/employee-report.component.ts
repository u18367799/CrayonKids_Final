import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import html2canvas from 'html2canvas';
import jsPDF from 'jspdf';
import { Chart } from 'chart.js';
import { ReportsService } from 'src/app/services/reports.service';
import * as moment from 'moment';

@Component({
  selector: 'app-employee-report',
  templateUrl: './employee-report.component.html',
  styleUrls: ['./employee-report.component.scss']
})
export class EmployeeReportComponent implements OnInit {

  constructor(public service: ReportsService, public formbuilder: FormBuilder) { }
  dateForm: any;
  chart = [];
  employees: any[];
  today = new Date().toLocaleDateString();
  maxdate=moment().format("YYYY-MM-DD");
  ngOnInit(): void {
    this.dateForm = this.formbuilder.group({
      startdate: ['', [Validators.required]],
      enddate: ['', [Validators.required]],
    });
    this.onSubmit()
  }
  onSubmit() {

    const date = this.dateForm.value
  if(this.dateForm.value.startdate > this.dateForm.value.enddate){
   console.log("no")
  }
  if(this.dateForm.value.startdate == "" || this.dateForm.value.enddate ==""){
    console.log("no")
  }
  else{
    
    this.service.getEmployees(date).subscribe((response) => {
      console.log(response);

      let keys = response['Employees'].map((d) => d.ProvinceName);
      let values = response['Employees'].map((d) => d.Total);

      this.employees = response['EmpNames'];

      var chart = new Chart('canvas', {
        type: 'bar',
        data: {
          labels: keys,
        
          datasets: [
            {
              data: values,
              borderColor: '#3cba9f',
              fill: false,
              backgroundColor: [
                'blue',
                'blue',
                'blue',
                'blue',
                'blue',
                'blue',                   
              ],
            },
          ],
        },
        options: {
          legend: {
            display: false,
          },
          title: {
            display: true,
            text: 'Employees Per Province',
            fontColor: "black",
            fontSize: 18,
          },
          scales: {
            xAxes: [
              {
                display: true,
                stepSize: 1,
                // barPercentage: number
              },
            ],
            yAxes: [
              {
                display: true,
                ticks: {
                  min: 0,
                  stepSize: 1,
                  // max: 8,
                },
              },
            ],
          },
        },
      });
         
  });}
}

  public download(): void {
    let DATA = document.getElementById('pdf');  
  
    html2canvas(DATA).then((canvas) => {
      let fileWidth = 208;
      let fileHeight = (canvas.height * fileWidth) / canvas.width;
  
      const FILEURI = canvas.toDataURL('image/png');
      let PDF = new jsPDF('p', 'mm', 'a4');
      let position = 0;
      PDF.addImage(FILEURI, 'PNG', 0, position, fileWidth, fileHeight);
  
      PDF.save('Employees.pdf');
    });
   
  }
}
