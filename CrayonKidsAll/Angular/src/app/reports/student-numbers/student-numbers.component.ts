import { Component, OnInit } from '@angular/core';
import html2canvas from 'html2canvas';
import jsPDF from 'jspdf';
import { ReportsService } from 'src/app/services/reports.service';

@Component({
  selector: 'app-student-numbers',
  templateUrl: './student-numbers.component.html',
  styleUrls: ['./student-numbers.component.scss']
})
export class StudentNumbersComponent implements OnInit {

  
  students: any[];
  today = new Date().toLocaleDateString();
  constructor(public service: ReportsService) { }

  ngOnInit(): void {
  }
  onSubmit(){
    this.service.getStudentNumbers().subscribe((response) => {
      console.log(response);

      this.students = response['Students'];
      console.log(this.students)

  })

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

    PDF.save('Student_Numbers.pdf');
  });
  document.getElementById("hide").style.display = "none"
 
}

}
