import { Component, OnInit } from '@angular/core';
import { pdfDefaultOptions } from 'ngx-extended-pdf-viewer';
@Component({
  selector: 'app-help-page',
  templateUrl: './help-page.component.html',
  styleUrls: ['./help-page.component.scss']
})
export class HelpPageComponent implements OnInit {

  public page = 1;
 
  public pageLabel!: string;

  constructor() { }

  ngOnInit(): void {
  }
 
   
  }

