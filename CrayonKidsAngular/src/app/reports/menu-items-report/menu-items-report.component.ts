import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import html2canvas from 'html2canvas';
import jsPDF from 'jspdf';
import { Chart } from 'chart.js';
import { ReportsService } from 'src/app/services/reports.service';
import * as moment from 'moment';

@Component({
  selector: 'app-menu-items-report',
  templateUrl: './menu-items-report.component.html',
  styleUrls: ['./menu-items-report.component.scss']
})
export class MenuItemsReportComponent implements OnInit {

  constructor(public service: ReportsService, public formbuilder: FormBuilder) { }
  dateForm: any;
  chart = [];
  menu: any[];
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
    
    this.service.getMenuItems(date).subscribe((response) => {
      console.log(response);

      let keys = response['Menu_Items'].map((d) => d.ProductName);
      let values = response['Menu_Items'].map((d) => d.TotalQuantity);

      this.menu = response['Menu_Items'];

      var chart = new Chart('canvas', {
        type: 'pie',
        data: {
          labels: keys,
        
          datasets: [
            {
              data: values,
              borderColor: '#3cba9f',
              fill: false,
              backgroundColor: [
                'blue',
                'red',
                'green',
                'yellow',
                'orange',
                'pink',                   
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
            text: 'Most Purchased Menu Items',
            fontColor: "black",
            fontSize: 18,
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
  
      PDF.save('Menu_Items.pdf');
    });
   
  }
}