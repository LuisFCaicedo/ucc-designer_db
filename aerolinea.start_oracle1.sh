docker run --name oracle1 \
        -p 1522:1521 \
        -e ORACLE_PASSWORD=oracle \
        -e APP_USER=aerolinea \
        -e APP_USER_PASSWORD=oracle \
        -e ORACLE_DATABASE=AEROLINEA \
        -d gvenzl/oracle-free