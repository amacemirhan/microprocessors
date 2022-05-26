

;Mehmed Emirhan Amac - 170420517
;Midpoint Circle Algorithm - Orta Nokta Daire Algoritmasi
    .model small
    .stack 100h
    .data
        xc dw 300;orta nokta x ekseni
        yc dw 250;orta nokta y ekseni
        x dw 0
        y dw 0
        p dw 0
        r dw 150;yaricap
      
    .code
    main proc
        mov ax,@data
        mov ds,ax  
            
        ;ekran secimi
        mov ah,00
        int 10h
        ;mode secimi
        mov al,12h
        int 10h
        
        ;orta noktayi ciz
        mov ah,0ch
        mov al,15
        mov cx,xc
        mov dx,yc
        int 10h
        
        ;daireyi ciz(midpoint algorithm)
        ;y=r
        mov ax,r 
        mov y,ax
        
        ;ilk noktayi ciz
        call plot
        ;p=1-r
        mov ax,01
        mov dx,r
        xor dx,0ffffh
        inc dx
        add ax,dx
        mov p,ax
        
        ;while(x<y) 
    loop1:  mov ax,x
        cmp ax,y
        jnc jump1
        
        ;x++
        inc x
        
        ;if(p<0)
        mov ax,p
        rcl ax,01
        jnc jump2
        
        ;p+=2*x+1
        mov ax,x
        rcl ax,01
        inc ax
        add ax,p
        jmp jump3
        
        ;else
        ;y--
        ;p+=(x-y)+1;
    jump2:  dec y
        mov ax,x
        mov dx,y
        xor dx,0ffffh
        inc dx
        add ax,dx
        rcl ax,01
        jnc jump4
        or ax,8000h
    jump4: inc ax
        add ax,p
        
    jump3:  mov p,ax
        ;nokta koy
        call plot
        jmp loop1
    jump1:  mov ah,00
        int 16h
        mov ax,0003
        int 10h
        
        stop:mov ah,4ch
        int 21h
    main endp

    plot proc
    mov ah,0ch
        mov al,04;rengarenk
                
        mov cx,xc
        add cx,x
        mov dx,yc
        add dx,y
        int 10h
               
        mov al,31;rengarenk
               
        mov cx,xc
        add cx,x
        mov dx,yc
        sub dx,y
        int 10h  
        
        mov al,45;rengarenk
        
        mov cx,xc
        sub cx,x
        mov dx,yc
        add dx,y
        int 10h 
        
        mov al,68;rengarenk
        
        mov cx,xc
        sub cx,x
        mov dx,yc
        sub dx,y
        int 10h  
        
        mov al,74;rengarenk
        
        mov cx,xc
        add cx,y
        mov dx,yc
        add dx,x
        int 10h  
        
        mov al,90;rengarenk
        
        mov cx,xc
        add cx,y
        mov dx,yc
        sub dx,x
        int 10h  
        
        mov al,92;rengarenk
        
        mov cx,xc
        sub cx,y
        mov dx,yc
        add dx,x
        int 10h    
        
        mov al,33;rengarenk
        
        mov cx,xc
        sub cx,y
        mov dx,yc
        sub dx,x
        int 10h
    
        ret
    plot endp 


    end




