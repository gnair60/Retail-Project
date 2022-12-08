#We run the Scoop_Script.sh file to load the updated data to hive

lastupdatedvalue_customer=`hive -e 'select max(c_custkey) from retaill_pg.customer'`

lastupdatedvalue_lineitem=`hive -e 'select max(l_orderkey) from retaill_pg.lineitem'`

lastupdatedvalue_nation=`hive -e 'select max(n_nationkey) from retaill_pg.nation'`

lastupdatedvalue_orders=`hive -e 'select max(o_orderkey) from retaill_pg.orders'`

lastupdatedvalue_part=`hive -e 'select max(p_partkey) from retaill_pg.part'`

lastupdatedvalue_partsupp=`hive -e 'select max(ps_partkey) from retaill_pg.partsupp'`

lastupdatedvalue_region=`hive -e 'select max(r_regionkey) from retaill_pg.region'`

lastupdatedvalue_supplier=`hive -e 'select max(s_suppkey) from retaill_pg.supplier'`



sqoop-import --connect jdbc:mysql://localhost:3306/retaill_pg?useSSL=false --username hiveuser --password hivepassword --table Customer --target-dir /user/hive/warehouse/retaill_pg.db/customer/ --incremental append --check-column C_CustKey --last-value ${lastupdatedvalue_customer} --fields-terminated-by "\001" -m 2;

sqoop-import --connect jdbc:mysql://localhost:3306/retaill_pg?useSSL=false --username hiveuser --password hivepassword --table LineItem --target-dir /user/hive/warehouse/retaill_pg.db/lineitem/ --incremental append --check-column L_OrderKey --last-value ${lastupdatedvalue_lineitem} --fields-terminated-by "\001" --split-by L_LineNumber;

sqoop-import --connect jdbc:mysql://localhost:3306/retaill_pg?useSSL=false --username hiveuser --password hivepassword --table Nation --target-dir /user/hive/warehouse/retaill_pg.db/nation/ --incremental append --check-column N_NationKey --last-value ${lastupdatedvalue_nation} --fields-terminated-by "\001" -m 1;

sqoop-import --connect jdbc:mysql://localhost:3306/retaill_pg?useSSL=false --username hiveuser --password hivepassword --table Orders --target-dir /user/hive/warehouse/retaill_pg.db/orders/ --incremental append --check-column O_OrderKey --last-value ${lastupdatedvalue_orders} --fields-terminated-by "\001";

sqoop-import --connect jdbc:mysql://localhost:3306/retaill_pg?useSSL=false --username hiveuser --password hivepassword --table Part --target-dir /user/hive/warehouse/retaill_pg.db/part/ --incremental append --check-column P_PartKey --last-value ${lastupdatedvalue_part} --fields-terminated-by "\001" -m 3;

sqoop-import --connect jdbc:mysql://localhost:3306/retaill_pg?useSSL=false --username hiveuser --password hivepassword --table Partsupp --target-dir /user/hive/warehouse/retaill_pg.db/partsupp/ --incremental append --check-column PS_PartKey --last-value ${lastupdatedvalue_partsupp} --fields-terminated-by "\001" -m 3 --split-by PS_PartKey;

sqoop-import --connect jdbc:mysql://localhost:3306/retaill_pg?useSSL=false --username hiveuser --password hivepassword --table Region --target-dir /user/hive/warehouse/retaill_pg.db/region/ --incremental append --check-column R_RegionKey --last-value ${lastupdatedvalue_region} --fields-terminated-by "\001" -m 1;

sqoop-import --connect jdbc:mysql://localhost:3306/retaill_pg?useSSL=false --username hiveuser --password hivepassword --table Supplier --target-dir /user/hive/warehouse/retaill_pg.db/supplier/ --incremental append --check-column S_SuppKey --last-value ${lastupdatedvalue_supplier} --fields-terminated-by "\001" -m 2;
