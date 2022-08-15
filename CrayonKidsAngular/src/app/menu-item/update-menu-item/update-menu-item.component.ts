import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Menu_ItemService } from 'src/app/services/menu-item.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-update-menu_item',
  templateUrl: './update-menu-item.component.html',
  styleUrls: ['./update-menu-item.component.css']
})
export class UpdateMenu_ItemComponent implements OnInit {

  Menu_Item_ID: any
  menu_itemDetails;
  menu_itemForm: FormGroup = new FormGroup({})
  constructor(public menu_itemService: Menu_ItemService, private router: Router,  private activeRoute: ActivatedRoute, private formBuilder: FormBuilder) { }

  ngOnInit(): void {
   
    this.activeRoute.params.subscribe(data => {
      this.Menu_Item_ID = data['id']
    });
    if(this.Menu_Item_ID !== ''){
      this.menu_itemService.viewMenu_Item(this.Menu_Item_ID)
      .subscribe(data => {
        this.menu_itemDetails = data;
        Object.assign(this.menu_itemDetails, data)
        
        this.menu_itemForm = this.formBuilder.group({
          "Menu_Item_Description": new FormControl(this.menu_itemDetails.Menu_Item_Menu_Item_Description, [Validators.required, Validators.maxLength(10), Validators.pattern(/^[A-Za-z]+$/)]),
          "Menu_Items_Purchased": new FormControl(this.menu_itemDetails.Menu_Item_Menu_Items_Purchased, [Validators.required, Validators.maxLength(50), Validators.pattern(/^[A-Za-z]+$/)]), 
          "Menu_Item_Purchase_Date": new FormControl('', [Validators.required, Validators.email]),
        })
      })
    }

  }
  updateMenu_Item(){
   this.menu_itemService.updateMenu_Item(this.menu_itemService.menu_ItemData).subscribe(data => {
    this.successUpdate()  
   })
  }
  successUpdate(){  
    Swal.fire(
      'Success!',
      'Updated Successfully!',     
    ).then(res => this.router.navigate(['/menu_itemlist']))   
  }
}

