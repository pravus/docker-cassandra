# Docker: Cassandra

A container full of Cassandra.

```
                                           .
                         . . t 8 .S .;.;X SS  8  S t ;:
                       :@ 8@X;@@ X .XX88%X8%Xt:@S%:8@t   ;
                  %:8 8;8%  X88888@  SX.  :.S%X%@:@X.  @S8 :
              t; @%@8.t;XS:  XSX@8S 88 ;;:%@:..;88;8;;  t:8;
           ;  XSX:;: X.;Xt@   t ::: .:X  S tX  :  8@ . %:X
         X ;::8S     88tS8tXt.%Xt.X88   ;    S X;Xt%.S:S
      :%8 @;   8  @  ;St%@8     %X:@  t 8      XX  @t
     .X@t 8     % %; 888 ;.     .SS; 8::X      :  .@@%
   . S:   8     %@ %:@ 8:@8 :  %.X88S. X      .:   S;
 %:8      S;     XS S::8;S8SXSX  8X; :X       @8tS.X8S:
.          SX;      8 @8% X 8 X@:t:::8      S. X8;    .
SX::%X8@%     8.     S%@ .8%tS8.:%X%      ..8@ %
     ..   .X8@XX :8:    :8.   ;8. .:.8:.X8;8 S :t
          %;X.  :: X.88S8 .88@ .S:%SS :%. @@X   :X.
          :   ;   :8t %8@8 X8  @St  :X  %8  tS
                  @   %tX   @  :t %S ;   ;   t.
                      ;.    :  8   :     X
                      @       t8   8
                              .    :

```

## Building

```bash
docker build -t cassandra:latest .
```

## Running

```bash
docker run --rm --name cassandra -it -p 9042:9042 cassandra:latest
```

### nodetool

```bash
docker exec -it cassandra nodetool ...
```

### cqlsh

```bash
docker exec -it cassandra cqlsh
```

## Debugging

```bash
docker exec -it cassandra /bin/bash
```
