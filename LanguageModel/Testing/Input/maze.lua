 
 S t a c k   =   r e q u i r e   " s t a c k "  
  
 W E S T   =   0  
 S O U T H   =   1  
 E A S T   =   2  
 N O R T H   =   3  
  
  
 g e n e r a t e M a z e   =   { w i d t h   =   G e n e r a t o r : g e t W i d t h ( ) ,   h e i g h t   =   G e n e r a t o r : g e t H e i g h t ( ) }  
  
 f u n c t i o n   g e n e r a t e M a z e : s e t M a z e ( )  
         s e l f : s e t B o r d e r s ( ) ;  
         s e l f : s e t W a l l s ( ) ;  
 e n d  
  
 f u n c t i o n   g e n e r a t e M a z e : s e t B o r d e r s ( )  
         f o r   i   =   0 ,   ( g e n e r a t e M a z e . h e i g h t   -   1 )   d o  
                 G e n e r a t o r . m a z e : G e t V a l u e ( 0 ,   i ) : s e t B o r d e r ( W E S T ) ;  
                 G e n e r a t o r . m a z e : G e t V a l u e ( g e n e r a t e M a z e . w i d t h   -   1 ,   i ) : s e t B o r d e r ( E A S T ) ;  
         e n d  
         f o r   j   =   0 ,   ( g e n e r a t e M a z e . w i d t h   -   1 )   d o  
                 G e n e r a t o r . m a z e : G e t V a l u e ( j ,   0 ) : s e t B o r d e r ( N O R T H ) ;  
                 G e n e r a t o r . m a z e : G e t V a l u e ( j ,   g e n e r a t e M a z e . h e i g h t   -   1 ) : s e t B o r d e r ( S O U T H ) ;  
         e n d  
 e n d  
  
 f u n c t i o n   g e n e r a t e M a z e : s e t W a l l s ( )  
         - - C a l c u l a t e   t o t a l   n u m b e r   o f   r o o m s  
         r o o m N u m   =   g e n e r a t e M a z e . w i d t h   *   g e n e r a t e M a z e . h e i g h t ;  
         - - S e l e c t   a   r a n d o m   r o o m   i n   t h e   m a z e ,   m a k e   s u r e   i t   i s   n o t   t h e   s t a r t i n g   p o i n t   o r   d e s t i n a t i o n  
         m a t h . r a n d o m s e e d ( o s . t i m e ( ) ) ;  
         c u r r e n t R o o m   =   { x   =   m a t h . r a n d o m ( g e n e r a t e M a z e . w i d t h )   -   1 ,   y   =   m a t h . r a n d o m ( g e n e r a t e M a z e . h e i g h t )   -   1 }  
         w h i l e   ( ( c u r r e n t R o o m . x   = =   0   a n d   c u r r e n t R o o m . y   = =   0 )   o r   ( c u r r e n t R o o m . x   = =   g e n e r a t e M a z e . w i d t h   -   1   a n d   c u r r e n t R o o m . y   = =   g e n e r a t e M a z e . h e i g h t   -   1 ) )   d o  
                 c u r r e n t R o o m   =   { x   =   m a t h . r a n d o m ( g e n e r a t e M a z e . w i d t h )   -   1 ,   y   =   m a t h . r a n d o m ( g e n e r a t e M a z e . h e i g h t )   -   1 } ;  
         e n d  
  
         p r i n t ( " i n i t i a l   c o - o r d i n a t e s : " ,   c u r r e n t R o o m . x ,   c u r r e n t R o o m . y )  
  
  
         - - C o u n t e r   f o r   n u m b e r   o f   v i s i t e d   c e l l s  
         v i s t e d R o o m s   =   1 ;  
         - - C r e a t e   a   s t a c k   f o r   r o o m s  
         r o o m S t a c k   =   S t a c k : C r e a t e ( ) ;  
  
         w h i l e   v i s t e d R o o m s   <   r o o m N u m   d o  
                 d i r e c t i o n I n d e x   =   s e l f : f i n d U n v i s i t e d R o o m ( c u r r e n t R o o m ) ;  
                 i f   d i r e c t i o n I n d e x   t h e n  
                         s e l f : k n o c k D o w n W a l l ( d i r e c t i o n I n d e x ,   c u r r e n t R o o m ) ;  
                         s t a c k C o p y O f R o o m   =   { x   =   c u r r e n t R o o m . x ,   y   =   c u r r e n t R o o m . y } ;   - -   E r r o r :   s t a c k   c h a n g e s   x   v a l u e   f r o m   n u m b e r   t o   s t r i n g  
                         r o o m S t a c k : p u s h ( s t a c k C o p y O f R o o m )  
                         c u r r e n t R o o m   =   s e l f : m o v e R o o m s ( d i r e c t i o n I n d e x ,   c u r r e n t R o o m ) ;  
                         v i s t e d R o o m s   =   v i s t e d R o o m s   +   1 ;  
                 e l s e  
                         c u r r e n t R o o m   =   r o o m S t a c k : p o p ( ) ;  
                 e n d  
         e n d  
         G e n e r a t o r : p r i n t M a z e ( ) ;  
 e n d  
  
 f u n c t i o n   g e n e r a t e M a z e : c h e c k I f U n v i s i t e d ( x ,   y )  
         u n v i s i t e d   =   t r u e ;  
         t e m p W a l l s   =   G e n e r a t o r . m a z e : G e t V a l u e ( x ,   y ) : g e t W a l l s ( ) ;  
         f o r   i   =   0 , 3   d o  
                 i f   t e m p W a l l s : G e t V a l u e ( i )   = =   f a l s e   t h e n  
                         u n v i s i t e d   =   f a l s e ;  
                 e n d  
         e n d  
         r e t u r n   u n v i s i t e d ;  
 e n d  
  
 f u n c t i o n   g e n e r a t e M a z e : f i n d U n v i s i t e d R o o m ( t a r g e t R o o m )  
         - - f i n d   r o o m   w i t h   a l l   w a l l s   u p   ( a d j a c e n t )   r a n d o m l y   p i c k   o n e   i f   m o r e   t h a n   o n e  
         u n v i s i t e d L i s t   =   { [ 0 ]   =   f a l s e ,   f a l s e ,   f a l s e ,   f a l s e }  
         r o o m B o r d e r s   =   G e n e r a t o r . m a z e : G e t V a l u e ( t a r g e t R o o m . x ,   t a r g e t R o o m . y ) : g e t B o r d e r s ( ) ;  
         - - C h e c k   W E S T   i f   n o t   a   b o r d e r  
         i f   r o o m B o r d e r s : G e t V a l u e ( W E S T )   = =   f a l s e   t h e n  
                 u n v i s i t e d L i s t [ W E S T ]   =   s e l f : c h e c k I f U n v i s i t e d ( t a r g e t R o o m . x   -   1 ,   t a r g e t R o o m . y )  
         e n d  
         - - C h e c k   S o u t h   i f   n o t   a   b o r d e r  
         i f   r o o m B o r d e r s : G e t V a l u e ( S O U T H )   = =   f a l s e   t h e n  
                 u n v i s i t e d L i s t [ S O U T H ]   =   s e l f : c h e c k I f U n v i s i t e d ( t a r g e t R o o m . x ,   t a r g e t R o o m . y   +   1 )  
         e n d  
         - - C h e c k   E a s t   i f   n o t   a   b o r d e r  
         i f   r o o m B o r d e r s : G e t V a l u e ( E A S T )   = =   f a l s e   t h e n  
                 u n v i s i t e d L i s t [ E A S T ]   =   s e l f : c h e c k I f U n v i s i t e d ( t a r g e t R o o m . x   +   1 ,   t a r g e t R o o m . y )  
         e n d  
         - - C h e c k   N o r t h   i f   n o t   a   b o r d e r  
         i f   r o o m B o r d e r s : G e t V a l u e ( N O R T H )   = =   f a l s e   t h e n  
                 u n v i s i t e d L i s t [ N O R T H ]   =   s e l f : c h e c k I f U n v i s i t e d ( t a r g e t R o o m . x ,   t a r g e t R o o m . y   -   1 )  
         e n d  
  
         - - C a l c u l a t e   n u m b e r   o f   u n v i s i t e d   r o o m s  
         n u m b e r O f U n v i s i t e d   =   0 ;  
         f o r   i   =   0 , 3   d o  
                 i f   u n v i s i t e d L i s t [ i ]   t h e n  
                         n u m b e r O f U n v i s i t e d   =   n u m b e r O f U n v i s i t e d   +   1 ;  
                 e n d  
         e n d  
  
         - - f o r   k e y , v a l u e   i n   p a i r s ( u n v i s i t e d L i s t )   d o   p r i n t ( k e y , v a l u e )   e n d  
         i f   n u m b e r O f U n v i s i t e d   = =   0   t h e n    
                 r e t u r n   n i l ;  
         e l s e    
                 i f   n u m b e r O f U n v i s i t e d   = =   1   t h e n  
                         f o r   i n d e x   =   0 , 3   d o  
                                 i f   u n v i s i t e d L i s t [ i n d e x ]   t h e n  
                                         r e t u r n   i n d e x ;  
                                 e n d  
                         e n d  
                 e l s e  
                         s e l e c t e d R o o m   =   m a t h . r a n d o m ( n u m b e r O f U n v i s i t e d ) ;   - -   r a n d o m   r o o m   o u t   o f   a v a i l a b l e  
                         b o o l C t r   =   0 ;  
                         f o r   i n d e x   =   0 , 3   d o    
                                 i f   u n v i s i t e d L i s t [ i n d e x ]   t h e n  
                                         b o o l C t r   =   b o o l C t r   +   1 ;  
                                 e n d  
                                 i f   b o o l C t r   = =   s e l e c t e d R o o m   t h e n  
                                         r e t u r n   i n d e x ;  
                                 e n d  
                         e n d  
                 e n d  
         e n d  
  
 e n d  
  
 f u n c t i o n   g e n e r a t e M a z e : m o v e R o o m s ( m o v e D i r e c t i o n ,   r o o m )  
         i f   m o v e D i r e c t i o n   = =   W E S T   t h e n  
                 r o o m . x   =   r o o m . x   -   1 ;  
         e l s e    
                 i f   m o v e D i r e c t i o n   = =   S O U T H   t h e n  
                         r o o m . y   =   r o o m . y   +   1 ;  
                 e l s e    
                         i f   m o v e D i r e c t i o n   = =   E A S T   t h e n  
                                 r o o m . x   =   r o o m . x   +   1 ;  
                         e l s e    
                                 i f   m o v e D i r e c t i o n   = =   N O R T H   t h e n  
                                         r o o m . y   =   r o o m . y   -   1 ;  
                                 e n d  
                         e n d  
                 e n d  
         e n d  
         r e t u r n   r o o m ;  
 e n d  
  
 f u n c t i o n   g e n e r a t e M a z e : k n o c k D o w n W a l l ( d i r e c t i o n ,   c o o r d i n a t e s )  
         o r i g i n R o o m   =   G e n e r a t o r . m a z e : G e t V a l u e ( c o o r d i n a t e s . x ,   c o o r d i n a t e s . y )  
  
         i f   d i r e c t i o n   = =   W E S T   t h e n  
                 o r i g i n R o o m : r e m o v e W a l l ( W E S T ) ;  
                 G e n e r a t o r . m a z e : G e t V a l u e ( c o o r d i n a t e s . x   -   1 ,   c o o r d i n a t e s . y ) : r e m o v e W a l l ( E A S T )  
         e l s e    
                 i f   d i r e c t i o n   = =   S O U T H   t h e n  
                         o r i g i n R o o m : r e m o v e W a l l ( S O U T H ) ;  
                         G e n e r a t o r . m a z e : G e t V a l u e ( c o o r d i n a t e s . x ,   c o o r d i n a t e s . y   +   1 ) : r e m o v e W a l l ( N O R T H )  
                 e l s e    
                         i f   d i r e c t i o n   = =   E A S T   t h e n  
                                 o r i g i n R o o m : r e m o v e W a l l ( E A S T ) ;  
                                 G e n e r a t o r . m a z e : G e t V a l u e ( c o o r d i n a t e s . x   +   1 ,   c o o r d i n a t e s . y ) : r e m o v e W a l l ( W E S T )                      
                         e l s e    
                                 i f   d i r e c t i o n   = =   N O R T H   t h e n  
                                         o r i g i n R o o m : r e m o v e W a l l ( N O R T H ) ;  
                                         G e n e r a t o r . m a z e : G e t V a l u e ( c o o r d i n a t e s . x ,   c o o r d i n a t e s . y   -   1 ) : r e m o v e W a l l ( S O U T H )  
                                 e n d  
                         e n d  
                 e n d  
         e n d  
 e n d  
  
 g e n e r a t e M a z e : s e t M a z e ( ) ;  
  
 [ = [ a d f a s d f a a s d f ] = ]  
  
 ' 3 4 4 5 '  
  
 x   -   1  
  
  
 