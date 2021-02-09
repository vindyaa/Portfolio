#include<iostream>
#include<conio.h>
#include<string.h>
using namespace std;



//fungsi header
header() {
	cout<<" =======================================================================================================================\n";
	cout<<"                                                       TIKET                                                            \n";
	cout<<"                                               WAHANA BERMAIN CERIA                                                     \n";
	cout<<" =======================================================================================================================\n";
	}
    
//-----------------------------------------------------------------------------------------------------------------------------------------    
	 	

main() {

int n, p=0, pilihan, ntik[1000], harga[5], jmlharga[10], tot_hrgtik['p'], bayar, pajak=10000, kembalian, tot_byr;
char kode_whn[5], nm_whn[5][5];


do {
	
	awal : 
		
	header();
		
	cout<<"\n Daftar Menu : 				 \n";

    cout<<"\t 1. Pembelian Tiket             \n";

    cout<<"\t 2. Keluar              	 	 \n\n";
     	
    cout<<"\n Pilih Menu  :  ";cin>>pilihan;
     	

system("CLS");
		
		
	
switch (pilihan){

case 1 :
	
	header();cout<<" "<<endl;

    cout<<" _______________________________________________________________________________________________________________________ \n";

	cout<<" | kode |                  Wahana Bermain                |                         Harga                              |  \n";
	cout<<" _______________________________________________________________________________________________________________________ \n";

	cout<<" |  1   | Bianglala                                      | Rp. 35000                                                  |  \n";
	cout<<" |  2   | Kora-kora                                      | Rp. 30000                                                  |  \n";
	cout<<" |  3   | Hysteria                                       | Rp. 100000                                                 |  \n";
	cout<<" |  4   | Tornado                                        | Rp. 45000                                                  |  \n";
	cout<<" |  5   | Kicir-kicir                                    | Rp. 30000                                                  |  \n";
	cout<<" _______________________________________________________________________________________________________________________ \n\n";



  //----------------------------------------------------------------------------------------------------------------------------------------------------

	
    mulai:

   	p++;
   		

	cout<<" Masukan Kode Wahana : ";cin>>kode_whn[n];cout<<endl;
	cout<<" Banyak tiket        : ";cin>>ntik[n];cout<<endl;
	cout<<" _______________________________________________________________________________________________________________________ \n\n";
    

	if(kode_whn[n]=='1') {
		strcpy(nm_whn[n],"Bianglala");
			harga[n]=35000;
	}
	      
	else if(kode_whn[n]=='2') {
	    strcpy(nm_whn[n],"Kora-kora");
	       	harga[n]=30000;
		}
	      
	else if(kode_whn[n]=='3') {
	strcpy(nm_whn[n],"Hysteria");
	    harga[n]=100000;
	    }
	      
	else if(kode_whn[n]=='4') {
	    strcpy(nm_whn[n],"Tornado");
	       	harga[n]=45000;
	    }
	      
	else if(kode_whn[n]=='5') {
	    strcpy(nm_whn[n],"Kicir-kicir");
	       	harga[n]=30000;
	    }
	      
	else {
	   	cout<<" - ";
	   		harga[n]=0;
	}

		
	jmlharga[n]=ntik[n]*harga[n];
	tot_hrgtik[p]=tot_hrgtik[p]+jmlharga[n];
	
	

	system("CLS");

//------------------------------------------------------------------------------------------------------------------------------------------------------
    
    
	header();cout<<endl;
    
    cout<<" _______________________________________________________________________________________________________________________ \n";

	cout<<"   |     Nama Wahana        |          Harga          |          Jumlah Tiket         |           Jumlah Harga           \n";
	cout<<" _______________________________________________________________________________________________________________________ \n";
		
	cout<<"   | "<<  nm_whn[n]<<"              |          "<<harga[n]<<"          |               "<< ntik[n]<<"               |              "<<jmlharga[n];
	cout<<endl;

	cout<<" _______________________________________________________________________________________________________________________ \n\n";
		
	
			
	cout<<"                                       							Total Harga  : "<<tot_hrgtik[p]<<endl;
		
//perhitungan pajak
	cout<<"                                       							Pajak        : "<<pajak<<endl;
	
//perhitungan biaya yang harus dibayar
	tot_byr=tot_hrgtik[p]+pajak;
	cout<<"                                       							Total Bayar  : "<<tot_byr<<endl;
		
//biaya yang dibayar customer		
	cout<<"                                       							Bayar        : ";cin>>bayar;
		
//kembalian untuk sisa biaya yang dibayar		
	kembalian=bayar-tot_byr;
	cout<<"                                       							Kembalian    : "<<kembalian<<endl<<endl;


    system ("PAUSE");
	system("CLS");
		

		goto awal;

		

case 2 : 


	cout<<"            Terima Kasih             ";
	
	
	}

	
}
	while (pilihan!=2);
	 
	getch();	
	return 0;
}
