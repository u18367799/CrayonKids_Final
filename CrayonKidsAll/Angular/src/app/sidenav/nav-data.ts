export const navbarData = [
    {
        routeLink: 'login',
        icon: 'fal fa-home',
        label: 'Home'
    },    
    {
        routeLink: 'employeelist',
        icon: 'fas fa-chalkboard-teacher',
        label: 'Employees'
    },
    {
        routeLink: 'studentlist',
        icon: 'fas fa-user-graduate',
        label: 'Students'
    },
    {
        routeLink: 'parentlist',
        icon: 'fas fa-user-friends',
        label: 'Parents'
    },
    {
        routeLink: '',
        icon: 'fas fa-school',
        label: 'School',
        submenuLevel1: [            
            {
                routeLink: '',
                icon: 'fas fa-university', 
                label: 'Main Campus',
                submenuLevel2: [
                    {
                        routeLink: 'classtypelist',
                        icon: 'fal fa-cog',
                        label: 'Class',
                    },
                    {
                        routeLink: '',
                        icon: 'fal fa-cog',
                        label: 'Equipment',
                    },
                    {
                        routeLink: '',
                        icon: 'fal fa-cog',
                        label: 'Supplier',
                    },
                    {
                        routeLink: 'schedule',
                        icon: 'fal fa-cog',
                        label: 'Schedule',
                    }
                ]
            }
        ]
    },
    


    {
        routeLink: '',
        icon: 'fal fa-file',
        label: 'Reports',
        submenuLevel1: [
            {
                routeLink: 'employee',
                icon: 'fal fa-tags', 
                label: 'Employee Report',
            },
            {
                routeLink: 'studentnumbers',
                icon: 'fal fa-tags', 
                label: 'Student Report',
            },
        
            {
                routeLink: 'menuitems',
                icon: 'fal fa-tags', 
                label: 'Menu_Items Report',
                submenuLevel2: [
                    
                ]
            }
        ]
    },

];