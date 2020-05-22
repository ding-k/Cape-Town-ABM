globals
[
  area                           ;area of the world
  unit-crop-profit               ;unit crop profit that farmers get in even scenario
  mean-yield-his                 ;mean yield of turtles for histogram plot
  mean-wealth-his                ;mean wealth of turtles for histogram plot
  transaction
  Ewater                         ;Efficiency of Water Use
  max-elevation                  ;Max elevation of Steenbras Reservoir
  month                          ;month count within a year
  year
  total-irrigation-demand-this-month
  total-irrigation-demand-monthly
  total-municipal-demand-this-month

  ;store total allocation of the month
  total-allocation-this-month
  total-allocation-monthly

  ;store ag allocation of the month
  ag-allocation-this-month
  ag-allocation-monthly

  ;store municipal allocation of the month
  mu-allocation-this-month
  mu-allocation-monthly

  ;store generation history
  generation-this-month
  energy-output-this-month
  generation-history

  municipal-water-use
  ag-water-use
  ;store dam inflow
  dam-inflow-monthly

  individual-demand
  days-in-month

  V-monthly
  V-Display

  mu-demand
  population
  population-history

;  growth-rate
  ;store reduction of the month
  reduction-monthly
  reduction-this-month

  avg-V

  ;policy-scenario
;  Scenario

  ;store water price of the month
;  water-price
  water-price-this-month
  water-price-history

  Kc-monthly
  tickss
  household-list
  domestic-demand-list
  other-municipal-demand-list
  income-list
  month-ratio
  month-mean-temp
  month-max-temp
  model-percent-diff
  total-energy-consumption
  new-cost
  total-added-capacity
  ; reduction history of different income levels
  reduction-30k-history
  reduction-57k-history
  reduction-117k-history
  reduction-200k-history
  bill-30k-history
  bill-57k-history
  bill-117k-history
  bill-200k-history
  water-energy-history
  hotter-history
]

breed [wards ward]
breed [BRmanagers BRmanager]
breed [VRmanagers VRmanager]
breed [TRmanagers TRmanager]
breed [SRmanagers SRmanager]
breed [Weathermans Weatherman]
breed [CPers CPer]
breed [SWfarmers SWfarmer]
breed [Dfarmers Dfarmer]
breed [STfarmers STfarmer]
breed [BVfarmers BVfarmer]
breed [Lfarmers Lfarmer]
breed [Wfarmers Wfarmer]
breed [Watermanagers Watermanager]

; set weather station also as special breeds



turtles-own
[
  rainfall-monthly
  temp-monthly
  SW-monthly
  identity

]

Watermanagers-own
[
  volume-this-month
  upper-limit
;  ag-allocation
;  city-allocation
;  SR-allocation
]


SRmanagers-own
[
  generation-capacity
  actual-generation
]

CPers-own
[
  CP-water-demand
;  population
;  growth-rate
]


;Weathermans-own
;[
;  rainfall-monthly
;  temp-monthly
;  identity
;]

wards-own
[
  ward-id
  households-in-ward
  ep
  income
  domestic-demand
  domestic-usage
  other-municipal-demand
  other-municipal-usage
  reduction-household
  water-bill-this-month
]

patches-own
[
;  behaviour    ;behaviour I am expressing
;  agent-who    ;who of turtle I belong to
;  patch-yield  ;as for turtle variable 'yield' - in some setup instances the agent gets their yield value from their homestead patch
  landtype ;The initial of Land, E/1 stands for Else, O/2 stand for Ocean, BR/3 stands for Berge River Reservoir, VR/4 stands for Voëlvlei
           ;Voëlvlei Reservoir, TR/5 stands for the Theewaterkloof Reservoir, SR/6 represents Steenbras Reservoir, C/7 Stands for Cape Town,
           ;SW/8 stands for Swartland, D/9 stands for Drakenstein, S/10 stands for Stellenbosch, B/11 stands for Breede Valley, L/12 stands for Langeberg,
           ;W/13 stands for Witzenberg
;  elevation
;  change-volume
  capacity
  volume
  inflow
;  Temp     ;Temperature daily temperature
;  Rain     ;Rainfall daily rainfall
;  ET       ;Evapotranspiration
  production;
  wine-irrigation-area
  AWC      ;Available water content
  SWD      ; soil water deficit
  irrigation-demand
]


to setup

  ca
  reset-ticks
  clear-output
  build-territory
  initialize-agents
  set month 2
  set year 2009
  set mean-yield-his []
  set mean-wealth-his []
  set total-irrigation-demand-monthly []
  set total-allocation-monthly []
  set ag-allocation-monthly []
  set mu-allocation-monthly []
  set generation-history []
  set V-monthly []
  set population 3.875
  set population-history [3.875]
;  set growth-rate 0.008
  set reduction-monthly []
  set water-price-history []
  set reduction-30k-history []
  set reduction-57k-history []
  set reduction-117k-history []
  set reduction-200k-history []
  set bill-30k-history []
  set bill-57k-history []
  set bill-117k-history []
  set bill-200k-history []
  set water-energy-history []
  set hotter-history []

  create-CPers 1 [
  ]
  create-Watermanagers 1 [
    set upper-limit 900000
    set volume-this-month 833388
  ]
  create-SRmanagers 1 [set generation-capacity 180]
;  set dam-inflow-monthly [-3946  -4534 -15426  18535  30979 207643 118213  45156  30054  31341  16926  13210 -11892 -13524   8313
;    39344  54305 109470  62115  51845  39288  30146  29651   1922 -11503  -3371  -9852  15244  29656 136839
;    111435  76244  72084  24522   6834   5097  -9201 -13016 -11072  28943  28306  67024 173508 185630  94650
;    31398  16158 -11437 -10866  -4691   -764  28554  32333 150717 144549 104123  31837  17705  43953  -6785
;    25068  -4331  -8691  19009  45421 189041 101325  32223  13062   6382  -1243  -3809  -4902  12724 -16563
;    -13051 -11433  56369 116734 115931  37017  38021 -16844 -12148   3047 -16435   8999  19227  20857  68766
;    144368 105964  51648  41917 -10343 -12876   -562  -2569   -452   -589  -4942  51382  53879  77581  56702
;    30685   1435   9823   7163  25645   3130  10079  64453 197680  91926 113151 105600   8604 -11230   1373]
  set dam-inflow-monthly [-3946]
  set municipal-water-use [31837 32620 34875 30150 26722 25140 25947 26722 26040 27652 31050 33945 35588 31640 34348 28830 27714
    24180 23901 24583 24570 28427 28650 34131 35650 32144 35309 30450 26164 25470 24304 24800 24210 27652
    29010 32302 33883 34104 34689 29730 27063 23790 23467 23653 23730 26629 28230 32612 35061 31444 32829
    28140 26567 24270 24490 23467 22350 25606 27600 30163 32891 32564 32984 28920 27218 22230 22630 23405
    24270 28427 30060 36208 37634 34636 37665 33690 30628 27330 27590 27869 27720 32209 32490 34100 34286
    30537 30535 26460 25761 23310 23467 25947 25680 28365 28170 28737 28489 24500 25358 23310 23219 20400
    20894 20553 19710 19933 19350 20460 19778 15988 17701 16650 17453 16680 16337 16740 15600 18104 17940
    18662]

  set ag-water-use [27590 26096 23901 12750  1488   690   713   713   690  3689  7290 20243 26722 25284 23126 12360  1426
    690   682   682   690  3565 10230 28334 37386 35364 32364 17280  2015   990   992   992   990  4991
    8280 22940 30256 29667 26226 13980  1612   780   775   775   780  4030  8970 24862 32829 31052 28427
    15180  1767   870   868   868   870  4371  8340 23157 30566 28896 26443 14130  1643   810   806   806
    810  4092 10290 28489 37603 35560 32550 17370  2015   990   992   992   990  5022 10770 29884 39432
    38628 34131 18240  2108  1050  1023  1023  1050  5270  9570 26505 34999 33096 30287 16170  1891   930
    930   930   930  4681  9600 26505 34100 30800     0     0     0     0     0     0     0     0 10830
    24211]

  set individual-demand [275 288 276 245 217 202 195 197 202 221 243 268 275 288 276 245 217 202 195 197 202 221 243 268 275 288 276 245 217 202 195 197 202 221 243
    268 275 288 276 245 217 202 195 197 202 221 243 268 275 288 276 245 217 202 195 197 202 221 243 268 275 288 276 245 217 202 195 197 202 221
    243 268 275 288 276 245 217 202 195 197 202 221 243 268 275 288 276 245 217 202 195 197 202 221 243 268 275 288 276 245 217 202 195 197 202
    221 243 268 275 288 276 245 217 202 195 197 202 221 243 268]

  set days-in-month [31 28 31 30 31 30 31 31 30 31 30 31 31 28 31 30 31 30 31 31 30 31 30 31 31 28 31 30 31 30 31 31 30 31 30 31 31 29 31 30 31 30 31 31 30 31 30 31 31 28 31 30 31 30 31 31 30 31 30 31 31 28 31 30 31 30 31 31 30 31 30 31 31 28 31 30 31 30 31 31 30 31 30 31 31 29 31 30 31 30 31 31 30 31 30 31 31 28 31 30 31 30 31 31 30 31 30 31 31 28 31 30 31 30 31 31 30 31 30 31]
  set avg-V [789934.5 730842.3 661785.3 594616.5 575904.7 584171.5 702642.2 796237.2 853529.7 875358.8 867419.3 848132.5] ;end of previous month, beginning of current month
  ;           12/31    1/31      2/28     3/31     4/30     5/31    6/30     7/31     8/31      9/30     10/31    11/30
  set Kc-monthly [0.5 0.3 0.2 0.1 0.1 0 0 0 0 0.1 0.2 0.4]

  set household-list [11559 11113 13971 19430  9688  8031 16565  7705  9697 13387 15389 10386 11464  7672 10247  9482 16826  7739 11101 10110 11506
    8330 11792 10647  8799 12060 19309 12424  7618  6457 12511 11373  9689  8875  8867  9810 11012  8949  9350 11437 16991 14589
    11029 12992 13799 13856 10582  9921 11450 10135 12368  8749  8140 15467  9083 16658 12020 11815  8641 10807 16918 12560 11309
    14212 11512  9311 20184  9158 10972 11291 11177 14928 10939 11455 11935  8148  9539  9734 11241 16782 11825 19048 18309 16352
    20484 22267 12049  7774 12394 10813 12962 11286 14220  9039]

  set income-list [230700 117000 117000  57500 225000  30000 225000  57500 117000  30000  57500 225000  57500  30000 225000  57500 225000  30000
    30000 117000 117000  30000  30000  57500  30000  30000  30000  30000  30000  30000 117000  57500  30000  57500  30000 117000
    117000  57500  30000 117000 225000 117000  57500 117000 225000 225000 117000 117000 225000 230700 117000  57500  57500  30000
    57500  30000 225000 225000 117000 225000  30000  57500  57500 225000 117000  30000  30000  57500  30000  57500 117000  30000
    30000  30000  57500  30000  30000  30000  30000  57500 117000 225000  30000  57500 225000  30000  30000  57500  57500 225000
    117000  30000 117000  57500]

  set domestic-demand-list [0.62297075 0.45405913 0.23507376 0.48116422 0.51568423 0.03803312 0.78496564 0.61856180 0.53120279 0.94274424 0.35430820
    0.37256916 1.54276404 0.47315264 1.89718136 1.00018399 0.49165197 0.41751509 0.05531240 2.07674546 0.13014273 0.05983382
    0.30683213 0.55277699 0.35417804 0.68280143 0.21298078 0.22474026 0.62501489 1.29155189 0.38688138 0.29771389 0.39031736
    0.51515030 0.28174415 0.42732485 0.33242686 0.42815049 0.38359106 0.90892821 0.51730522 0.40631110 0.54257229 0.37616493
    0.97894782 0.21027288 0.82303117 0.53937815 0.75499926 0.87039534 0.55175824 0.48341584 0.09556491 0.25082004 0.27563986
    0.22748149 0.46958449 0.85382129 0.84927409 0.59878154 0.32767147 0.47688563 0.36835248 0.60936161 0.19042288 0.29059794
    0.58261096 0.59472699 0.44879550 0.59398304 0.52862501 0.42767106 0.10505393 0.29236611 0.21070263 0.43192012 1.10373190
    0.35801750 0.47632790 2.01069733 1.20675383 0.40550844 0.11941767 0.42291878 0.33260298 0.43731135 0.51273606 0.51384560
    0.97958404 0.66438222 0.55824830 0.10018222 1.54407887 0.33460057]; to add the base mean demand for each of the ward this is demand per household this is kl per day

  set other-municipal-demand-list [3086.1081  2162.5539  1407.5209  4006.7232  2141.1209   130.9046  5572.6954  2042.5794  2207.6029  5408.7930  2336.7638
    1658.3586  7579.8201  1555.7259  8331.6074  4064.4620  3545.3726  1384.7783   263.1527  8998.2414   641.7524   213.6067
    1550.6419  2522.3214  1335.6054  3529.1080  1762.4768  1196.6456  2040.5843  3574.0931  2074.4027  1451.1000  1620.7650
    1959.4110  1070.6680  1796.5958  1568.8648  1642.0795  1537.1042  4455.1765  3766.9427  2540.4311  2564.5842  2094.4863
    5789.3576  1248.6604  3732.5639  2293.3588  3704.8892  3780.6243  2924.6340  1812.6022   333.3850  1662.6144  1072.9872
    1624.0228  2419.0310  4323.3851  3145.1046  2773.2995  2375.8054  2567.0072  1785.2992  3711.5345   939.4921  1159.6103
    5039.7513  2334.2185  2110.3647  2874.2839  2532.1893  2736.1172   492.5078  1435.3088  1077.7440  1508.2651  4512.2137
    1493.5467  2294.7437 14461.5097  6115.6560  3310.3392   937.0363  2963.8148  2919.8741  4173.2622  2647.6958  1711.9867
    5203.2705  3078.8421  3101.1490   484.5671  9410.0578  1296.1948]

  set month-ratio [1.1641153 1.2207191 1.1694553 1.0487718 0.9280883 0.8533286 0.8319687 0.8426486 0.8576006 0.9409042 1.0231399 1.1192595] ;this is month to month ratio compared to annual average
;  set month-mean-temp [71 72 69 64 60 56 55 56 58 62 66 69]
;  set month-mean-temp [21.7 22.2 20.6 17.8 15.6 13.3 12.8 13.3 14.4 16.7 18.9 20.6]
  set month-mean-temp [20.90 21.05 19.80 17.45 14.85 12.95 12.25 12.65 13.95 15.95 18.35 19.90]
  set month-max-temp [80 81 79 74 69 65 64 65 67 72 75 79]
  let ward-index 1
  create-wards 94 [
    set ward-id ward-index
    set households-in-ward item (ward-id - 1) household-list * Population-ratio
    set domestic-demand item (ward-id - 1) domestic-demand-list / 1000 ; just for intial setup, change to previous line once have real data calculated covert number from kl to ml per household per day
    set other-municipal-demand item (ward-id - 1) other-municipal-demand-list / 1000
    set income item (ward-id - 1) income-list
    set reduction-household 0
    let mean-income 92701
    ;set ep random-normal ( water-price-elasticity +  (abs water-price-elasticity) * (income - mean-income) / mean-income )   sd-water-price-elasticity
    ifelse income < 30001 ;first income level 30000
    [
;      set ep  (water-price-elasticity -  0.3)
      set ep random-normal ( water-price-elasticity -  0.3)   sd-water-price-elasticity
      if ep < -1
      [set ep -0.99]
    ]
    [ ifelse income < 57501 ;income is second level 57500
      [
;        set ep  (water-price-elasticity -  0.2)
        set ep random-normal (water-price-elasticity - 0.2)  sd-water-price-elasticity
        if ep < -1
        [set ep -0.99]
      ]
      [ifelse income < 117001 ; third income level
        [
;          set ep  water-price-elasticity
          set ep random-normal water-price-elasticity sd-water-price-elasticity
          if ep > 0
          [set ep -0.01]
        ]
        [; else fourth income level >200000
;          set ep  (water-price-elasticity +  0.3)
          set ep random-normal (water-price-elasticity + 0.3) sd-water-price-elasticity
          if ep > 0
          [set ep -0.01]
        ]
      ]
    ]

    set ward-index ward-index + 1

  ] ; set up the water users for 94 wards
  if Scenario = 4
  [let desal-cost 36
    let gw-cost 7.5
    let sw-cost 5
    let wwr-cost 7.5

    let desal-energy-consumption 4
    let wwr-energy-consumption 2

    let sw-existing-capacity 1350
    let desal-capacity 120
    let gw-capacity 100
    let sw-added-capacity 60
    let wwr-capacity 70; wastewater reuse
    set total-added-capacity (wwr-capacity + desal-capacity  + gw-capacity); MLD the added capacity does not include surface water, the added surface water is reflected in the expanded dam storage capacity
                                                                           ; let added-volume total-added-capacity; from MLD to monthly inflow
    set new-cost (gw-cost * gw-capacity + desal-cost * desal-capacity + sw-cost * (sw-added-capacity + sw-existing-capacity) + wwr-cost * wwr-capacity) / (total-added-capacity + sw-existing-capacity)
    print new-cost
    set total-energy-consumption (desal-energy-consumption * desal-capacity * 1000 + wwr-energy-consumption * wwr-capacity * 1000) / 1000 ; convert from per kL to per ML and from kwh to mwh
    print total-energy-consumption   ; unit in MW
    print "mwh per day"
    set water-price new-cost * (1 + profit)
    print water-price
  ]



;  load-rain-temp-history
end

to go
  ;;;;;;;;;;;;;;
  print("month")
  print(month)
  print("year")
  print(year)

  update-reservoir-elevation
  irrigate-land
;  calculate-municipal-demand
;  ask patches with [landtype = 3]
;  [show elevation]
;  ifelse Scenario-1? ;if the switch is on, it goes to scenario 1. else it goes to scenario 2
  ifelse Scenario = 1
  [
    scenario-one
  ] ;scenario 1
  [
    ifelse Scenario = 2
    [
      scenario-two
      ;test water bill
      print ([water-bill-this-month] of wards with [income = 30000])
    ];scenario 2
    [
      ifelse Scenario = 3
      [scenario-three];scenario 3
      [scenario-four];scenario 4
    ]; Scenario 3, 4
  ] ; Scenario 2, 3, 4

  ;store generation capacity
  set generation-history lput energy-output-this-month generation-history
  ;store water reduction history
  set reduction-30k-history lput (1 - reduction-30k) reduction-30k-history
  set reduction-57k-history lput (1 - reduction-57k) reduction-57k-history
  set reduction-117k-history lput (1 - reduction-117k) reduction-117k-history
  set reduction-200k-history lput (1 - reduction-200k) reduction-200k-history
  ;store water bill history
  set bill-30k-history  lput  bill-30k  bill-30k-history
  set bill-57k-history  lput  bill-57k  bill-57k-history
  set bill-117k-history lput  bill-117k bill-117k-history
  set bill-200k-history lput  bill-200k bill-200k-history
  ifelse Scenario = 4
  []
  [set water-energy-history lput 0 water-energy-history]

  set month month + 1

  ifelse month > 12
  [set month 1
    set year year + 1
    let current-pop (population * (1 + growth-rate))
    set population current-pop
    set population-history lput population population-history
    if ticks > 117
    [set ag-water-use sentence ag-water-use [30892	29393	26748	14280	1659	805	806	806	805	4123	8900	24671]
     set days-in-month sentence days-in-month [31 28 31 30 31 30 31 31 30 31 30 31]
    ]
  ]
  []
  print("ticks")
  print(ticks)

  tick ;total month
;  set tickss ticks
;  if ticks = 120   [stop]

end


to scenario-one
  let V [volume-this-month] of one-of Watermanagers

  if V > 921000
  [set V 921000]
  set V-Display V
  set V-monthly lput V V-monthly
;  print V
  let ag-D last total-irrigation-demand-monthly + (share-other-crops-irrigation * (item ticks ag-water-use)) ;updated wine grapes irrigation demand + the rest of the agricultural water usage
  ;calculate municipal demand we use average monthly city demand predrought
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;this is the initial municipal model in the WSC paper
  let ID item ticks individual-demand
  print ID
  print "individual-demand"
  let DAY item ticks days-in-month
  print DAY
  print "days in a month"
  let POP population
  print POP
  print "population in millions"
  set mu-demand (ID * DAY * POP)
  let mu-D mu-demand
  print mu-D
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  let mu-D (item ticks individual-demand) * (item ticks days-in-month) * [population] of one-of CPers
;  print mu-D
  ifelse ( V > (0.5 * [upper-limit] of one-of Watermanagers) ); no restriction
  [
    print "above 0.5, no restriction"
    set ag-allocation-this-month ag-D
    set mu-allocation-this-month mu-D
    set reduction-this-month 0
    set total-allocation-this-month ag-allocation-this-month + mu-allocation-this-month
    ask one-of SRmanagers
    [
      set actual-generation 180
      set energy-output-this-month actual-generation
    ]
  ];no restriction
  [
    ifelse ( V > (0.45 * [upper-limit] of one-of Watermanagers)  )
    [
      print "restriction 2, 0.5-0.45"
      let reduction 0.2
      set reduction-this-month reduction
      set ag-allocation-this-month ( 1 - reduction ) * ag-D
      set mu-allocation-this-month (1 - reduction) * mu-D
      set total-allocation-this-month ag-allocation-this-month + mu-allocation-this-month
      ask one-of SRmanagers
      [
        set actual-generation 180
        set energy-output-this-month actual-generation
      ]
    ]; between 45% to 50% level 2 restriction
    [;less than 45%
      ifelse ( V > (0.20 * [upper-limit] of one-of Watermanagers) )
      [
        print "restriction 3, in between 0.45-0.5"
        let reduction 0.3
        set reduction-this-month reduction
        set ag-allocation-this-month ( 1 - reduction ) * ag-D
        set mu-allocation-this-month (1 - reduction) * mu-D
        set total-allocation-this-month ag-allocation-this-month + mu-allocation-this-month
        ask one-of SRmanagers
        [
          set actual-generation 180
          set energy-output-this-month actual-generation
        ]
      ]; between 45% and 20% level 3 restriction
      [;less than 20%
        print "restriction 6, all municipal allocation"
        set mu-allocation-this-month 450 * item ticks days-in-month
        set ag-allocation-this-month 0
        set reduction-this-month 1
        ifelse ( V > 0.15 * [upper-limit] of one-of Watermanagers) ; for the hydropower dam, if between 20% and 15% of V, it will decrease the generation capacity
        [
          ask one-of SRmanagers
          [
            let ratio (V / [upper-limit] of one-of Watermanagers )
            set actual-generation (20 * ratio - 3) * generation-capacity
            set energy-output-this-month actual-generation
            ;need to save generation history
          ]
        ]
        [
          ask one-of SRmanagers
          [set actual-generation 0]
        ];below 15% failure
      ];level 6 restriction
    ]
  ]
  set total-allocation-monthly lput total-allocation-this-month total-allocation-monthly
  set ag-allocation-monthly lput ag-allocation-this-month ag-allocation-monthly
  set mu-allocation-monthly lput mu-allocation-this-month mu-allocation-monthly
  set generation-history lput ([actual-generation] of one-of SRmanagers) generation-history
  set reduction-monthly lput reduction-this-month reduction-monthly
  update-reservoir-elevation
;  last total-irrigation-demand-monthly


end

to scenario-two
  let V [volume-this-month] of one-of Watermanagers
  if V > 900000
  [set V 900000]
  if V < 0
  [set V 0]
  ;debug
  print "dam volume"
  print V

  set V-Display V
  set V-monthly lput V V-monthly
;  print V
  let ag-D last total-irrigation-demand-monthly + (share-other-crops-irrigation * (item ticks ag-water-use)) ;updated wine grapes irrigation demand + the rest of the water
  ;calculate municipal demand we use average monthly city demand predrought. Initial model in the wsc paper
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  let ID item ticks individual-demand
  let ID 200
  ifelse ticks > 118
  [set ID 200]
  [set ID item ticks individual-demand]


;  print "individual-demand"
  let DAY item ticks days-in-month
;  print DAY
;  print "days in a month"
  let POP population
;    print POP
;  print "population in millions"
  set mu-demand (ID * DAY * POP)
  let mu-D mu-demand
;  print mu-D
  let CP-temp item 0 [item ticks temp-monthly] of Weathermans with [identity = "Cape_Town"]
  let mean-Temp item (month - 1) month-mean-temp
  let is-hot? FALSE

  if CP-temp > mean-Temp
  [
;    let increase-ratio random-normal demand-increase-rate 0.001
    set is-hot? TRUE
;    set mu-D ( mu-D * ( 1 + demand-increase-rate * (CP-temp - mean-Temp) ) ) ; change the
;    print CP-temp
;    Print mean-Temp
;    print "High Temp Warning !!!!!!!!!!!!!Demand More!!!!!!!!!!!!!!!!!"
;    let diff (CP-temp - mean-Temp)
;    set hotter-history item ticks hotter-history
  ]

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; new model using heterogenous model to calculate municipal water demand
  ;municipal-demand ; submodel caculate total unrestricted water demand
  ;let's write the code here and
;  let TOT-household-demand (sum [ domestic-demand * (1 + growth-rate) ^ (year - 2009) * households-in-ward ] of wards ) * (item (ticks) days-in-month) * (item (month - 1) month-ratio) ; sum (annual demand per day per ward * growthrate )* days in a month * month/annual ratio
;  print TOT-household-demand
;  print "total household demand"
;  let TOT-other-municipal-demand ( sum [other-municipal-demand] of wards ) * (item (ticks) days-in-month) * (item (month - 1) month-ratio)
;  print TOT-other-municipal-demand
;  print "tot other municipal demand"
;  let TOT-urban-demand TOT-household-demand + TOT-other-municipal-demand
;  print TOT-urban-demand
;  print "tot urban demand"
;  let avg-ep mean [ ep ] of wards
;  print avg-ep
;  print "average ep"

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; then in the next we need to calculate a allocation reduction allocation is simply calculated by a demand reduction ratio
  ifelse ticks < 12
  [
;    print "Beginning year, no restriction"
    set ag-allocation-this-month ag-D
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    set mu-allocation-this-month mu-D; original model
    ask wards
      [
        set other-municipal-usage (other-municipal-demand * (item (ticks) days-in-month) * (item (month - 1) month-ratio))
;        let change-in-price (new-price - water-price)
        ;; ask the water demand to change
        let domestic-demand-current-month domestic-demand
        if is-hot? = TRUE
        [
          ifelse income < 100000
          [
            set domestic-demand-current-month domestic-demand * (1 + demand-increase-rate * (CP-temp - mean-Temp));increase initial demand
          ]
          [
            ;do nothing
          ]
        ]
        set domestic-usage (domestic-demand-current-month  * households-in-ward * (1 + growth-rate) ^ (year - 2009) * (item (ticks) days-in-month) * (item (month - 1) month-ratio) )
        ;set up reduction ratio, in this case zero
        set reduction-household 0
        ; calculate water bill for each household
        let individual-usage domestic-usage / households-in-ward
        set water-bill-this-month individual-usage * water-price * 1000 ; multiply by 1000 because the water price is in kl and usage is in ML
      ]
      let TOT-household-usage sum [ domestic-usage ] of wards
;      print TOT-household-usage
;      print "total household usage under restriction"
      let TOT-other-municipal-usage sum [other-municipal-usage] of wards
;      print TOT-other-municipal-usage
;      print "tot other municipal usage under restriction"
      let TOT-urban-usage TOT-household-usage + TOT-other-municipal-usage
;      print TOT-urban-usage
;      print "tot urban usage under restriction diversified"
;      print mu-D
;      print "tot urban usage original"
      set model-percent-diff abs (TOT-urban-usage - mu-D) / mu-D
      set mu-allocation-this-month TOT-urban-usage

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    set total-allocation-this-month ag-allocation-this-month + mu-allocation-this-month
    set water-price-this-month water-price
      ask one-of SRmanagers
      [set actual-generation 180
    set energy-output-this-month actual-generation]
  ]; the beginning year, no data to compare
  [
    let InF-this-year item ticks dam-inflow-monthly
    let InF-last-year item (ticks - 12) dam-inflow-monthly
    let V-normal item (month - 1) avg-V
    set reduction-this-month 0
    set reduction-monthly lput reduction-this-month reduction-monthly
;    let RF-this-year  [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Worcester"]) + [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Porterville"]) + [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Paarl"]) + [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Strand"])
;    let RF-last-year  [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Worcester"]) + [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Porterville"]) + [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Paarl"]) + [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Strand"])
;
;    let RF-last-year [item (ticks - 12) rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Worcester"])
;    ifelse InF-this-year > InF-last-year
;    ifelse RF-this-year > RF-last-year
    ifelse V > 0.9 * V-normal
    [
      print "enough water, no restriction"
      set ag-allocation-this-month ag-D
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      set mu-allocation-this-month mu-D; original model
      ask wards
      [
        set other-municipal-usage (other-municipal-demand * (item (ticks) days-in-month) * (item (month - 1) month-ratio))
        ;        let change-in-price (new-price - water-price)
        ;; ask the water demand to change
        let domestic-demand-current-month domestic-demand
        if is-hot? = TRUE
        [
          ifelse income < 100000
          [
            set domestic-demand-current-month domestic-demand * (1 + demand-increase-rate * (CP-temp - mean-Temp));increase initial demand
          ]
          [
            ;do nothing
          ]
        ]
        set domestic-usage (domestic-demand-current-month  * households-in-ward * (1 + growth-rate) ^ (year - 2009) * (item (ticks) days-in-month) * (item (month - 1) month-ratio) )
        ;set up reduction ratio in this case zero
        set reduction-household 0

        ; calculate water bill for each household
        let individual-usage domestic-usage / households-in-ward
        set water-bill-this-month individual-usage * water-price * 1000 ; multiply by 1000 because the water price is in kl and usage is in ML
      ]
      let TOT-household-usage sum [ domestic-usage ] of wards
;      print TOT-household-usage
;      print "total household usage under restriction"
      let TOT-other-municipal-usage sum [other-municipal-usage] of wards
;      print TOT-other-municipal-usage
;      print "tot other municipal usage under restriction"
      let TOT-urban-usage TOT-household-usage + TOT-other-municipal-usage
;      print TOT-urban-usage
;      print "tot urban usage under restriction diversified"
;      print mu-D
;      print "tot urban usage original"
      set model-percent-diff abs (TOT-urban-usage - mu-D) / mu-D
      set mu-allocation-this-month TOT-urban-usage

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      set total-allocation-this-month ag-allocation-this-month + mu-allocation-this-month
      set water-price-this-month water-price
      set reduction-this-month 0
      set reduction-monthly lput reduction-this-month reduction-monthly
      ask one-of SRmanagers
      [set actual-generation 180
      set energy-output-this-month actual-generation]
    ];no restriction
    [
;      print "adaptive restriction"

      let reduction (1 - (abs (V / V-normal)))
      print "reduction target"
      print reduction
;      for calibration only
;      set reduction 0
      set reduction-this-month reduction
      ; check reduction level, and make reduction a sub-model

      ;      let reduction (1 - (abs (RF-this-year / (RF-last-year) ) ) )
      ; this following commented code is use price elasticity to calculate new water price
      ;      let Q1-minus-Q0 (1 - reduction) - 1
;      let Q1-plus-Q0 (1 - reduction) + 1
;      let deltaQ Q1-minus-Q0 / Q1-plus-Q0
;      ;let new-price (water-price - (water-price * reduction / water-price-elasticity))
;      let new-price (deltaQ + water-price-elasticity) / (water-price-elasticity - deltaQ) * water-price
      ; water price as a linear function of reduction
;      let new-price K-price * reduction + water-price
      ; new price is calculated based
      let new-price water-price * ((1 - reduction) / 1) ^ (1 / water-price-elasticity)


      set water-price-this-month new-price
      print "current water price"
      print water-price-this-month

;      set water-price-history lput new-price water-price-history

      set reduction-monthly lput reduction reduction-monthly
;      print reduction
      set ag-allocation-this-month ( 1 - reduction ) * ag-D; agricultural model
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      set mu-allocation-this-month (1 - reduction) * mu-D; municipal water allocation calculation in the original model
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;new municipal allocation
;      cal-municipal-demand-s2
      ask wards
      [
        set other-municipal-usage (other-municipal-demand * (item (ticks) days-in-month) * (item (month - 1) month-ratio)) * (1 - reduction)
        ;; ask the water demand to change
        let domestic-demand-current-month domestic-demand

        if is-hot? = TRUE
        [
          ifelse income < 100000
          [
            set domestic-demand-current-month domestic-demand * (1 + demand-increase-rate * (CP-temp - mean-Temp));increase initial demand
          ]
          [
            ;do nothing
          ]
        ]

        ;let change-in-price (new-price - water-price)

        let month-demand (domestic-demand-current-month  * households-in-ward * (1 + growth-rate) ^ (year - 2009) * (item (ticks) days-in-month) * (item (month - 1) month-ratio) )

        ; calculate original demand in month based on disggregation of annual water usage
;        let month-demand (domestic-demand-current-month * households-in-ward  * (item (ticks) days-in-month) * (item (month - 1) month-ratio) )
;

;        set domestic-usage (month-demand + month-demand * change-in-price * ep / water-price)
        ; midpoint method
;        let deltaP (new-price - water-price) / (new-price + water-price)
;        set domestic-usage month-demand * (1 + ep * deltaP) / (1 - ep * deltaP)

        ; Integral method
        set domestic-usage month-demand *  ( new-price / water-price ) ^ ep

        if domestic-usage < 0
        [
          set domestic-usage 0
        ]
        ;calculate reduction ratio for the wards,
        set reduction-household (month-demand - domestic-usage) / month-demand

        ; calculate water bill for each household
;        let individual-usage domestic-usage / households-in-ward
        set water-bill-this-month (domestic-usage / households-in-ward) * new-price * 1000 ; multiply by 1000 because the water price is in kl and usage is in ML

      ];end of ask wards
      let TOT-household-usage sum [ domestic-usage ] of wards
      print "total household usage under restriction"
      print TOT-household-usage

      let TOT-other-municipal-usage sum [other-municipal-usage] of wards
      print TOT-other-municipal-usage
      print "tot other municipal usage under restriction"

      let TOT-urban-usage TOT-household-usage + TOT-other-municipal-usage
      print "tot urban usage under restriction diversified"
      print TOT-urban-usage
;      print mu-D
;      print "tot urban usage original"
      set model-percent-diff abs (TOT-urban-usage - (1 - reduction) * mu-D) / mu-D ; (1 - reduction) * mu-D) is the reduced water usage in the original model
      set mu-allocation-this-month TOT-urban-usage
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      set total-allocation-this-month ag-allocation-this-month + mu-allocation-this-month

      ifelse V > 0.2 * [upper-limit] of one-of Watermanagers
      [
        ask one-of SRmanagers
        [set actual-generation 180
        set energy-output-this-month actual-generation]
      ];no impact on hydro

      [
        ifelse ( V > 0.15 * [upper-limit] of one-of Watermanagers) ; for the hydropower dam, if between 20% and 15% of V, it will decrease the generation capacity
        [
          ask one-of SRmanagers
          [
            let ratio (V / [upper-limit] of one-of Watermanagers )
            set actual-generation (20 * ratio - 3) * generation-capacity
            set energy-output-this-month actual-generation
            ;need to save generation history
          ]
        ];partial generation

        [
          ask one-of SRmanagers
          [set actual-generation 0
          set energy-output-this-month actual-generation]
        ];below 15% failure

      ]; impact on hydro

    ]
  ]
  set total-allocation-monthly lput total-allocation-this-month total-allocation-monthly
  set ag-allocation-monthly lput ag-allocation-this-month ag-allocation-monthly
  set mu-allocation-monthly lput mu-allocation-this-month mu-allocation-monthly
;  set generation-history lput ([actual-generation] of one-of SRmanagers) generation-history
  set water-price-history lput water-price-this-month water-price-history

  update-reservoir-elevation


end

to scenario-three ; set free water for indigenous households
  let V [volume-this-month] of one-of Watermanagers
  if V > 900000
  [set V 900000]
  set V-Display V
  set V-monthly lput V V-monthly
;  print V
  let ag-D last total-irrigation-demand-monthly + (share-other-crops-irrigation * (item ticks ag-water-use)) ;updated wine grapes irrigation demand + the rest of the water
  ;calculate municipal demand we use average monthly city demand predrought. Initial model in the wsc paper
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  let ID 200
  ifelse ticks > 119
  [set ID 200]
  [set ID item ticks individual-demand]
;  print ID
;  print "individual-demand"
  let DAY item ticks days-in-month
;  print DAY
;  print "days in a month"
  let POP population
    print POP
;  print "population in millions"
  set mu-demand (ID * DAY * POP)
  let mu-D mu-demand
;  print mu-D
  let CP-temp item 0 [item ticks temp-monthly] of Weathermans with [identity = "Cape_Town"]
  let mean-Temp item (month - 1) month-mean-temp
  let is-hot? FALSE
  if CP-temp > mean-Temp
  [
;    let increase-ratio random-normal demand-increase-rate 0.001
    set is-hot? TRUE
;    set mu-D ( mu-D * ( 1 + demand-increase-rate * (CP-temp - mean-Temp) ) ) ; change the
;    print CP-temp
;    Print mean-Temp
;    print "High Temp Warning !!!!!!!!!!!!!Demand More!!!!!!!!!!!!!!!!!"

  ]

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; new model using heterogenous model to calculate municipal water demand
  ;municipal-demand ; submodel caculate total unrestricted water demand
  ;let's write the code here and
;  let TOT-household-demand (sum [ domestic-demand * (1 + growth-rate) ^ (year - 2009) * households-in-ward ] of wards ) * (item (ticks) days-in-month) * (item (month - 1) month-ratio) ; sum (annual demand per day per ward * growthrate )* days in a month * month/annual ratio
;  print TOT-household-demand
;  print "total household demand"
;  let TOT-other-municipal-demand ( sum [other-municipal-demand] of wards ) * (item (ticks) days-in-month) * (item (month - 1) month-ratio)
;  print TOT-other-municipal-demand
;  print "tot other municipal demand"
;  let TOT-urban-demand TOT-household-demand + TOT-other-municipal-demand
;  print TOT-urban-demand
;  print "tot urban demand"
;  let avg-ep mean [ ep ] of wards
;  print avg-ep
;  print "average ep"

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; then in the next we need to calculate a allocation reduction allocation is simply calculated by a demand reduction ratio
  ifelse ticks < 12
  [
;    print "Beginning year, no restriction"
    set ag-allocation-this-month ag-D
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    set mu-allocation-this-month mu-D; original model
    ask wards
      [
        set other-municipal-usage (other-municipal-demand * (item (ticks) days-in-month) * (item (month - 1) month-ratio))
;        let change-in-price (new-price - water-price)
        ;; ask the water demand to change
        let domestic-demand-current-month domestic-demand
        if is-hot? = TRUE
        [
          ifelse income < 100000
          [
            set domestic-demand-current-month domestic-demand * (1 + demand-increase-rate * (CP-temp - mean-Temp));increase initial demand
          ]
          [
            ;do nothing
          ]
        ]
        set domestic-usage (domestic-demand-current-month  * households-in-ward * (1 + growth-rate) ^ (year - 2009) * (item (ticks) days-in-month) * (item (month - 1) month-ratio) )
        ;set up reduction ratio, in this case zero
        set reduction-household 0
        ifelse income < 30001
        [
          let individual-usage domestic-usage / households-in-ward
          set water-bill-this-month ( individual-usage * 1000 - 6) * water-price  ; individual usage multiply by 1000 because the water price is in kl and usage is in ML
        ];indigenous households free 6k water
        [
          let individual-usage domestic-usage / households-in-ward
          set water-bill-this-month individual-usage * water-price * 1000 ; multiply by 1000 because the water price is in kl and usage is in ML
        ]
      ]
      let TOT-household-usage sum [ domestic-usage ] of wards
;      print TOT-household-usage
;      print "total household usage under restriction"
      let TOT-other-municipal-usage sum [other-municipal-usage] of wards
;      print TOT-other-municipal-usage
;      print "tot other municipal usage under restriction"
      let TOT-urban-usage TOT-household-usage + TOT-other-municipal-usage
;      print TOT-urban-usage
;      print "tot urban usage under restriction diversified"
;      print mu-D
;      print "tot urban usage original"
      set model-percent-diff abs (TOT-urban-usage - mu-D) / mu-D
      set mu-allocation-this-month TOT-urban-usage

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    set total-allocation-this-month ag-allocation-this-month + mu-allocation-this-month
    set water-price-this-month water-price
      ask one-of SRmanagers
      [set actual-generation 180
    set energy-output-this-month actual-generation]
  ]; the beginning year, no data to compare
  [
    let InF-this-year item ticks dam-inflow-monthly
    let InF-last-year item (ticks - 12) dam-inflow-monthly
    let V-normal item (month - 1) avg-V
    set reduction-this-month 0
    set reduction-monthly lput reduction-this-month reduction-monthly
;    let RF-this-year  [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Worcester"]) + [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Porterville"]) + [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Paarl"]) + [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Strand"])
;    let RF-last-year  [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Worcester"]) + [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Porterville"]) + [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Paarl"]) + [item ticks rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Strand"])
;
;    let RF-last-year [item (ticks - 12) rainfall-monthly] of Weatherman (item 0 [who] of Weathermans with [identity = "Worcester"])
;    ifelse InF-this-year > InF-last-year
;    ifelse RF-this-year > RF-last-year
    ifelse V > 0.9 * V-normal
    [
;      print "enough water, no restriction"
      set ag-allocation-this-month ag-D
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      set mu-allocation-this-month mu-D; original model
      ask wards
      [
        set other-municipal-usage (other-municipal-demand * (item (ticks) days-in-month) * (item (month - 1) month-ratio))
        ;        let change-in-price (new-price - water-price)
        ;; ask the water demand to change
        let domestic-demand-current-month domestic-demand
        if is-hot? = TRUE
        [
          ifelse income < 100000
          [
            set domestic-demand-current-month domestic-demand * (1 + demand-increase-rate * (CP-temp - mean-Temp));increase initial demand
          ]
          [
            ;do nothing
          ]
        ]
        set domestic-usage (domestic-demand-current-month  * households-in-ward * (1 + growth-rate) ^ (year - 2009) * (item (ticks) days-in-month) * (item (month - 1) month-ratio) )
        ;set up reduction ratio in this case zero
        set reduction-household 0
        ; calculate water bill for each household
        ifelse income < 30001
        [
          let individual-usage domestic-usage / households-in-ward
          set water-bill-this-month ( individual-usage * 1000 - 6) * water-price  ; individual usage multiply by 1000 because the water price is in kl and usage is in ML
        ];indigenous households free 6k water
        [
          let individual-usage domestic-usage / households-in-ward
          set water-bill-this-month individual-usage * water-price * 1000 ; multiply by 1000 because the water price is in kl and usage is in ML
        ]
      ]
      let TOT-household-usage sum [ domestic-usage ] of wards
;      print TOT-household-usage
;      print "total household usage under restriction"
      let TOT-other-municipal-usage sum [other-municipal-usage] of wards
;      print TOT-other-municipal-usage
;      print "tot other municipal usage under restriction"
      let TOT-urban-usage TOT-household-usage + TOT-other-municipal-usage
;      print TOT-urban-usage
;      print "tot urban usage under restriction diversified"
;      print mu-D
;      print "tot urban usage original"
      set model-percent-diff abs (TOT-urban-usage - mu-D) / mu-D
      set mu-allocation-this-month TOT-urban-usage

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      set total-allocation-this-month ag-allocation-this-month + mu-allocation-this-month
      set water-price-this-month water-price
      set reduction-this-month 0
      set reduction-monthly lput reduction-this-month reduction-monthly
      ask one-of SRmanagers
      [set actual-generation 180
      set energy-output-this-month actual-generation]
    ];no restriction
    [
;      print "adaptive restriction"

      let reduction (1 - (abs (V / V-normal)))
      set reduction-this-month reduction
      ;      let reduction (1 - (abs (RF-this-year / (RF-last-year) ) ) )
;      let new-price water-price - water-price * reduction / water-price-elasticity
;
      let new-price water-price * ((1 - reduction) / 1) ^ (1 / water-price-elasticity)


      set water-price-this-month new-price
;      set water-price-history lput new-price water-price-history

      set reduction-monthly lput reduction reduction-monthly
;      print reduction
      set ag-allocation-this-month ( 1 - reduction ) * ag-D; agricultural model
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      set mu-allocation-this-month (1 - reduction) * mu-D; municipal water allocation calculation in the original model
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;new municipal allocation
;      cal-municipal-demand-s2
      ask wards
      [
        set other-municipal-usage (other-municipal-demand * (item (ticks) days-in-month) * (item (month - 1) month-ratio)) * (1 - reduction)
        ;; ask the water demand to change
        let domestic-demand-current-month domestic-demand
        if is-hot? = TRUE
        [
          ifelse income < 100000
          [
            set domestic-demand-current-month domestic-demand * (1 + demand-increase-rate * (CP-temp - mean-Temp));increase initial demand
          ]
          [
            ;do nothing
          ]
        ]
;        let change-in-price (new-price - water-price)
        let month-demand (domestic-demand-current-month  * households-in-ward * (1 + growth-rate) ^ (year - 2009) * (item (ticks) days-in-month) * (item (month - 1) month-ratio) )

;        set domestic-usage (month-demand + month-demand * change-in-price * ep / water-price)
        set domestic-usage month-demand *  ( new-price / water-price ) ^ ep

        ;calculate reduction ratio for the wards,
        if income < 30001
        [
          if domestic-usage / households-in-ward < (6 / 1000 )
          [set domestic-usage (6 / 1000 ) * households-in-ward ]; give indiginous households free basic water even under drought conditions
        ];free water for 6 kl

        set reduction-household (month-demand - domestic-usage) / month-demand

        if reduction-household < 0
        [set reduction-household 0]

        ifelse income < 30001
        [
          let individual-usage domestic-usage / households-in-ward
          set water-bill-this-month ( individual-usage * 1000 - 6) * new-price  ; individual usage multiply by 1000 because the water price is in kl and usage is in ML
        ];indigenous households free 6k water
        [
          let individual-usage domestic-usage / households-in-ward
          set water-bill-this-month individual-usage * new-price * 1000 ; multiply by 1000 because the water price is in kl and usage is in ML
        ]

      ]

      let TOT-household-usage sum [ domestic-usage ] of wards
;      print TOT-household-usage
;      print "total household usage under restriction"
      let TOT-other-municipal-usage sum [other-municipal-usage] of wards
;      print TOT-other-municipal-usage
;      print "tot other municipal usage under restriction"
      let TOT-urban-usage TOT-household-usage + TOT-other-municipal-usage
;      print TOT-urban-usage
;      print "tot urban usage under restriction diversified"
;      print mu-D
;      print "tot urban usage original"
      set model-percent-diff abs (TOT-urban-usage - (1 - reduction) * mu-D) / mu-D ; (1 - reduction) * mu-D) is the reduced water usage in the original model
      set mu-allocation-this-month TOT-urban-usage
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      set total-allocation-this-month ag-allocation-this-month + mu-allocation-this-month

      ifelse V > 0.2 * [upper-limit] of one-of Watermanagers
      [
        ask one-of SRmanagers
        [set actual-generation 180
        set energy-output-this-month actual-generation]
      ];no impact on hydro

      [
        ifelse ( V > 0.15 * [upper-limit] of one-of Watermanagers) ; for the hydropower dam, if between 20% and 15% of V, it will decrease the generation capacity
        [
          ask one-of SRmanagers
          [
            let ratio (V / [upper-limit] of one-of Watermanagers )
            set actual-generation (20 * ratio - 3) * generation-capacity
            set energy-output-this-month actual-generation
            ;need to save generation history
          ]
        ];partial generation

        [
          ask one-of SRmanagers
          [set actual-generation 0
          set energy-output-this-month actual-generation]
        ];below 15% failure

      ]; impact on hydro

    ]
  ]
  set total-allocation-monthly lput total-allocation-this-month total-allocation-monthly
  set ag-allocation-monthly lput ag-allocation-this-month ag-allocation-monthly
  set mu-allocation-monthly lput mu-allocation-this-month mu-allocation-monthly
;  set generation-history lput ([actual-generation] of one-of SRmanagers) generation-history
  set water-price-history lput water-price-this-month water-price-history
; commeent out update reservoir because this process is now done at the big six
  update-reservoir-elevation
end

to scenario-four
  ;this is augmentation from new water sources
  ;desalination 120 MLD potential 150MLD energy cost 3.5 - 4 kwh/kL monetary cost: 12-36 R/kL
  ;groundwater 100 MLD potential 200 MLD cost 7.5 R/kL
  ;surfacewater 60 MLD 5 R/kL
  ;wastewater reuse 70 MLD energy cost: 2kwh/kL, monetary cost: 7.5 R/kL

   ;;;;;;;;;;;;;;;;;;;;;;
;  the following has been moved to set up
;  let desal-cost 36
;  let gw-cost 7.5
;  let sw-cost 5
;  let wwr-cost 7.5
;
;  let desal-energy-consumption 4
;  let wwr-energy-consumption 2
;
;  let sw-existing-capacity 1350
;  let desal-capacity 120
;  let gw-capacity 100
;  let sw-added-capacity 60
;  let wwr-capacity 70; wastewater reuse
;  let total-added-capacity (wwr-capacity + desal-capacity  + gw-capacity); MLD the added capacity does not include surface water, the added surface water is reflected in the expanded dam storage capacity
;  let added-volume total-added-capacity; from MLD to monthly inflow
;  let new-cost (gw-cost * gw-capacity + desal-cost * desal-capacity + sw-cost * (sw-added-capacity + sw-existing-capacity) + wwr-cost * wwr-capacity) / (total-added-capacity + sw-existing-capacity)
;  print new-cost
;  let total-energy-consumption (desal-energy-consumption * desal-capacity * 1000 + wwr-energy-consumption * wwr-capacity * 1000) / 1000 ; convert from per kL to per ML and from kwh to mwh
;  print total-energy-consumption
;  print "mwh per day"
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; here is the apdatation of the model from previous policy 2 without any water restrictions
;  let new-normal-reduction 0.2
  let DAY item ticks days-in-month
;  print DAY

  let V [volume-this-month] of one-of Watermanagers
  if V >  921900 ; original capacity 900000 + new augmented (60 * 365) in ML
  [set V 921900]
  set V (V + total-added-capacity * DAY)

  set V-Display V
  set V-monthly lput V V-monthly
;  print V
  let ag-D last total-irrigation-demand-monthly + (share-other-crops-irrigation * (item ticks ag-water-use)) ;updated wine grapes irrigation demand + the rest of the water
  ;calculate municipal demand we use average monthly city demand predrought. Initial model in the wsc paper
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  let ID 200
  ifelse ticks > 119
  [set ID 200]
  [set ID item ticks individual-demand]
;  print ID
;  print "individual-demand"

;  print "days in a month"
  let POP population
;    print POP
;  print "population in millions"
  set mu-demand (ID * DAY * POP)
  let mu-D mu-demand
;  print mu-D
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;module for demand change as a response to temperature rise
  let CP-temp item 0 [item ticks temp-monthly] of Weathermans with [identity = "Cape_Town"]
  let mean-Temp item (month - 1) month-mean-temp
  let is-hot? FALSE
  if CP-temp > mean-Temp
  [
;    let increase-ratio random-normal demand-increase-rate 0.001
    set is-hot? TRUE
;    set mu-D ( mu-D * ( 1 + demand-increase-rate * (CP-temp - mean-Temp) ) ) ; change the
;    print CP-temp
;    Print mean-Temp
;    print "High Temp Warning !!!!!!!!!!!!!Demand More!!!!!!!!!!!!!!!!!"

  ]

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; new model using heterogenous model to calculate municipal water demand
  ;municipal-demand ; submodel caculate total unrestricted water demand
  ;let's write the code here and
;  let TOT-household-demand (sum [ domestic-demand * (1 + growth-rate) ^ (year - 2009) * households-in-ward ] of wards ) * (item (ticks) days-in-month) * (item (month - 1) month-ratio) ; sum (annual demand per day per ward * growthrate )* days in a month * month/annual ratio
;  print TOT-household-demand
;  print "total household demand"
;  let TOT-other-municipal-demand ( sum [other-municipal-demand] of wards ) * (item (ticks) days-in-month) * (item (month - 1) month-ratio)
;  print TOT-other-municipal-demand
;  print "tot other municipal demand"
;  let TOT-urban-demand TOT-household-demand + TOT-other-municipal-demand
;  print TOT-urban-demand
;  print "tot urban demand"
;  let avg-ep mean [ ep ] of wards
;  print avg-ep
;  print "average ep"

  set ag-allocation-this-month ag-D * (1 - new-normal-reduction)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;    set mu-allocation-this-month mu-D; original model
  ask wards
    [
      set other-municipal-usage (other-municipal-demand * (1 - new-normal-reduction) * (item (ticks) days-in-month) * (item (month - 1) month-ratio))
      ;        let change-in-price (new-price - water-price)
      ;; ask the water demand to change
      let domestic-demand-current-month domestic-demand * (1 - new-normal-reduction)
      if is-hot? = TRUE
      [
        ifelse income < 100000
        [
          set domestic-demand-current-month domestic-demand-current-month * (1 + demand-increase-rate * (CP-temp - mean-Temp));increase initial demand
        ]
        [
          ;do nothing
        ]
      ]
      set domestic-usage (domestic-demand-current-month  * households-in-ward * (1 + growth-rate) ^ (year - 2009) * (item (ticks) days-in-month) * (item (month - 1) month-ratio) )
      ;set up reduction ratio, in this case zero
      set reduction-household 0
      ; calculate water bill for each household
      let individual-usage domestic-usage / households-in-ward
      set water-bill-this-month individual-usage * water-price * 1000 ; multiply by 1000 because the water price is in kl and usage is in ML
  ]
  let TOT-household-usage sum [ domestic-usage ] of wards
;  print TOT-household-usage
;  print "total household usage under restriction"
  let TOT-other-municipal-usage sum [other-municipal-usage] of wards
;  print TOT-other-municipal-usage
;  print "tot other municipal usage under restriction"
  let TOT-urban-usage TOT-household-usage + TOT-other-municipal-usage
;  print TOT-urban-usage
;  print "tot urban usage under restriction diversified"
;  print mu-D
;  print "tot urban usage original"
  set model-percent-diff abs (TOT-urban-usage - mu-D) / mu-D
  set mu-allocation-this-month TOT-urban-usage

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  set total-allocation-this-month ag-allocation-this-month + mu-allocation-this-month

;  ask one-of SRmanagers
;  [set actual-generation 180
;  set energy-output-this-month actual-generation]
       ifelse V > 0.2 * [upper-limit] of one-of Watermanagers
      [
        ask one-of SRmanagers
        [set actual-generation 180
        set energy-output-this-month actual-generation]
      ];no impact on hydro

      [
        ifelse ( V > 0.15 * [upper-limit] of one-of Watermanagers) ; for the hydropower dam, if between 20% and 15% of V, it will decrease the generation capacity
        [
          ask one-of SRmanagers
          [
            let ratio (V / [upper-limit] of one-of Watermanagers )
            set actual-generation (20 * ratio - 3) * generation-capacity
            set energy-output-this-month actual-generation
            ;need to save generation history
          ]
        ];partial generation

        [
          ask one-of SRmanagers
          [set actual-generation 0
          set energy-output-this-month actual-generation]
        ];below 15% failure

      ]; impact on hydro

  set total-allocation-monthly lput total-allocation-this-month total-allocation-monthly
  set ag-allocation-monthly lput ag-allocation-this-month ag-allocation-monthly
  set mu-allocation-monthly lput mu-allocation-this-month mu-allocation-monthly
;  set generation-history lput ([actual-generation] of one-of SRmanagers) generation-history
  set water-price-history lput water-price water-price-history
  set water-energy-history lput (DAY * total-energy-consumption) water-energy-history ;

    update-reservoir-elevation
end

to-report vol
  report total-allocation-this-month
end

to-report bill-30k
  report mean [water-bill-this-month] of wards with [income = 30000]
end

to-report bill-57k
  report mean [water-bill-this-month] of wards with [income = 57500]
end

to-report bill-117k
  report mean [water-bill-this-month] of wards with [income = 117000]
end

to-report bill-200k
  report mean [water-bill-this-month] of wards with [income > 200000]
end



to-report reduction-30k
  report mean [reduction-household] of wards with [income = 30000]

end

to-report reduction-57k
  report mean [reduction-household] of wards with [income = 57500]

end

to-report reduction-117k
  report mean [reduction-household] of wards with [income = 117000]

end

to-report reduction-200k
  report mean [reduction-household] of wards with [income > 200000]

end

;to cal-municipal-demand-s2
;      ask wards
;      [
;        set other-municipal-usage (other-municipal-demand * (item (ticks) days-in-month) * (item (month - 1) month-ratio)) * (1 - reduction)
;        let change-in-price (new-price - water-price)
;        let month-demand (domestic-demand  * households-in-ward * (1 + growth-rate) ^ (year - 2009) * (item (ticks) days-in-month) * (item (month - 1) month-ratio) )
;        set domestic-usage (month-demand + month-demand * change-in-price * ep / water-price)
;      ]
;      let TOT-household-usage sum [ domestic-usage ] of wards
;      print TOT-household-usage
;      print "total household usage under restriction"
;      let TOT-other-municipal-usage sum [other-municipal-usage] of wards
;      print TOT-other-municipal-usage
;      print "tot other municipal usage under restriction"
;      let TOT-urban-usage TOT-household-usage + TOT-other-municipal-usage
;      print TOT-urban-usage
;      print "tot urban usage under restriction diversified"
;      print mu-allocation-this-month
;      print "tot urban usage original"
;      set mu-allocation-this-month TOT-urban-usage
;
;
;
;end


to update-reservoir-elevation
  let inflow-this-month item ticks dam-inflow-monthly
  ask one-of Watermanagers [set volume-this-month (volume-this-month + inflow-this-month - total-allocation-this-month)]
;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  ;regression apporach to calculate inflow. Not for now
;  let R 0
;  let T 0
;  let MW 0
;  Let AW 0
;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  ask Weatherman (item 0 [who] of Weathermans with [identity = "Worcester"])
;  [
;    set R item ticks rainfall-monthly
;    set T item ticks temp-monthly
;    ask patches with [landtype = 5] ;for theewaterkloof
;    [
;      ifelse ticks < 36
;      [
;        set change-volume 0
;      ]
;      [set change-volume (17710 + 10900 * R - 2633 * T - 0.496 * MW - (2.31 * AW - 0.1668 * AW * R - 0.0337 * AW * T))
;        set inflow change-volume + 0.496 * MW + (2.31 * AW - 0.1668 * AW * R - 0.0337 * AW * T)
;        set volume volume + inflow
;;      set historic-volume lput volume historic-volume
;      ]
;    ]
;  ]
;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  ask Weatherman (item 0 [who] of Weathermans with [identity = "Porterville"])
;  [
;    set R item ticks rainfall-monthly
;    set T item ticks temp-monthly
;    set MW item ticks municipal-water-use
;    set AW item ticks ag-water-use
;    ask patches with [landtype = 4] ;for Voalvlei
;    [
;      ifelse ticks < 36
;      [set change-volume 0]
;      [set change-volume (41760 + 6167 * R - 831 * T - 0.496 * MW - (2.31 * AW - 0.1668 * AW * R - 0.0337 * AW * T))
;        set inflow change-volume + 0.496 * MW + (2.31 * AW - 0.1668 * AW * R - 0.0337 * AW * T)
;        set volume volume + inflow
;;      set historic-volume lput volume historic-volume
;      ]
;      print change-volume
;    ]
;  ]
;    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  ask Weatherman (item 0 [who] of Weathermans with [identity = "Strand"])
;  [
;    set R item ticks rainfall-monthly
;    set T item ticks temp-monthly
;    ask patches with [landtype = 6] ;for Steenbras
;    [
;      ifelse ticks < 36
;      [set change-volume 0]
;      [set change-volume (17293.39  + 1600.49 * R - 321.06 * T )
;;        set historic-volume lput volume historic-volume
;      ]
;    ]
;  ]
;      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  ask Weatherman (item 0 [who] of Weathermans with [identity = "Paarl"])
;  [
;    set R item ticks rainfall-monthly
;    set T item ticks temp-monthly
;    ask patches with [landtype = 3] ;for Berge River
;    [
;      ifelse ticks < 36
;      [set change-volume 0]
;      [set change-volume (43480.6  + 1481.8 * R - -707.2 * T )
;;        set historic-volume lput volume historic-volume
;      ]
;    ]
;  ]

;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


end

to recharge-reservoir
  ; each water manager first get the volume of the reservoir, the demand, and allocate the water accordingly.

end


to irrigate-land
;read rainfall and temperature data from a file, each station will have a reading of that day or period say mean is Temp-3
;  let i 7 ; start with cape town
;  let Temp-list [1 2 3 4 5 6] ; just for now
;  let Rain-list [1 2 3 4 5 6] ; just for now
;  let I-index         [1 2 3 4 5 6] ; Just for now (I need to be pre-calculated) for Thronthwaite method
;  let m         [1 2 3 4 5 6] ; just for now (m need to be pre-calculated) for Thronthwaite method
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  let Rain-list []
;  let Temp-list []
  let SW-this-month []
  set total-irrigation-demand-this-month 0
;  while [i != 14] ;so it loops through all areas
;  [
;    ask Weatherman (item 0 [who] of turtles with [identity = "Ct-AWS"])
;    [
;    let Rain-list []
;    let Temp-list []
;      set Rain-list rainfall-monthly
;
;    ]
;    ask patches with [landtype = i]
;    [
;;      set Temp item ( i - 7) Temp-list
;      set Rain item ( i - 7) Rain-list
;      print Rain
;      print "month"
;      print "tick"
;;      set ET 16 * (10 * Temp / (item ( i - 7) I-index)) ^ (item ( i - 7) m )
;;      let Water-Demand Ewater * (ET - Rain) * 100 ; say we have the grid of 100 km^2
;    ]
;    set i i + 1
;  ]

  ;The initial of Land, E/1 stands for Else, O/2 stand for Ocean, BR/3 stands for Berge River Reservoir, VR/4 stands for Voëlvlei
  ;Voëlvlei Reservoir, TR/5 stands for the Theewaterkloof Reservoir, SR/6 represents Steenbras Reservoir, C/7 Stands for Cape Town,
  ;SW/8 stands for Swartland, D/9 stands for Drakenstein, S/10 stands for Stellenbosch, B/11 stands for Breede Valley, L/12 stands for Langeberg,
  ;W/13 stands for Witzenberg

  ;The irrigation logic is to first ask the weatherman to set the soil water deficit of the month to SW-this-month,
  ;whoever (winelands) follow the weather man will have its SW.
  ;To change the Weathermans to the wine regions and Cape Town.
  ; station-names: ["Breed_Valley" "Langberg" "Witzenberg" "Swartland" "Drakenstein" "Cape_Town" "Stellenbosch"]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  ask Weatherman (item 0 [who] of Weathermans with [identity = "Worcester"]) ;original code
  ask Weatherman (item 0 [who] of Weathermans with [identity = "Breed_Valley"]) ;og code Worcester was used
  [
        set SW-this-month item ticks SW-monthly
  ]

  ask patches with [landtype = 11] ;for breede valley
  [

    set SWD AWC - SW-this-month
    if SWD < 0 [set SWD 0]
    ifelse member? month [6 7 8 9]
    [
;      print "not irrigate"
    set irrigation-demand 0
    ]
    [
;      print "irrigate"
      set irrigation-demand SWD * 0.0254 * wine-irrigation-area * 1000 / 1000000 ; ML
    ]
  ]
  set total-irrigation-demand-this-month [irrigation-demand] of one-of patches with [landtype = 11]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ask Weatherman (item 0 [who] of Weathermans with [identity = "Langberg"]) ;og code Worcester was used
  [
        set SW-this-month item ticks SW-monthly
  ]

  ask patches with [landtype = 12] ; for langeberg
  [
    set SWD AWC - SW-this-month
    if SWD < 0 [set SWD 0]
    ifelse member? month [6 7 8 9]
    [
;      print "not irrigate"
      set irrigation-demand 0
    ]
    [
;      print "irrigate"
      set irrigation-demand SWD * 0.0254 * wine-irrigation-area * 1000 / 1000000 ; ML
    ]
  ]
  set total-irrigation-demand-this-month total-irrigation-demand-this-month + [irrigation-demand] of one-of patches with [landtype = 12]


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ask Weatherman (item 0 [who] of Weathermans with [identity = "Witzenberg"]) ;og code porterville was used
  [
      set SW-this-month item ticks SW-monthly
  ]

  ask patches with [landtype = 13] ; for Witzenberg
  [

    set SWD AWC - SW-this-month
    if SWD < 0 [set SWD 0]
    ifelse member? month [6 7 8 9]
    [
;      print "not irrigate"
      set irrigation-demand 0
    ]
    [
;      print "irrigate"
      set irrigation-demand SWD * 0.0254 * wine-irrigation-area * 1000 / 1000000 ; ML
    ]
  ]
  set total-irrigation-demand-this-month total-irrigation-demand-this-month + [irrigation-demand] of one-of patches with [landtype = 13]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  ask Weatherman (item 0 [who] of Weathermans with [identity = "Malmesbury"]); og code malsebury was used for swartland
  ask Weatherman (item 0 [who] of Weathermans with [identity = "Swartland"])
  [
      set SW-this-month item ticks SW-monthly
  ]

  ask patches with [landtype = 8] ; for Swartland
  [

    set SWD AWC - SW-this-month
    if SWD < 0 [set SWD 0]
    ifelse member? month [6 7 8 9]
    [
;      print "not irrigate"
      set irrigation-demand 0
    ]
    [
;      print "irrigate"
      set irrigation-demand SWD * 0.0254 * wine-irrigation-area * 1000 / 1000000 ; ML
    ]
  ]
  set total-irrigation-demand-this-month total-irrigation-demand-this-month + [irrigation-demand] of one-of patches with [landtype = 8]
;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  ask Weatherman (item 0 [who] of Weathermans with [identity = "Paarl"])
  ask Weatherman (item 0 [who] of Weathermans with [identity = "Drakenstein"])
  [
      set SW-this-month item ticks SW-monthly

  ]
  ask patches with [landtype = 9] ; for Drakenstein
  [

    set SWD AWC - SW-this-month
    if SWD < 0 [set SWD 0]
    ifelse member? month [6 7 8 9]
    [
;      print "not irrigate"
      set irrigation-demand 0
    ]
    [
;      print "irrigate"
      set irrigation-demand SWD * 0.0254 * wine-irrigation-area * 1000 / 1000000 ; ML
    ]
  ]
  set total-irrigation-demand-this-month total-irrigation-demand-this-month + [irrigation-demand] of one-of patches with [landtype = 9]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  ask Weatherman (item 0 [who] of Weathermans with [identity = "Ct_AWS"])
  ask Weatherman (item 0 [who] of Weathermans with [identity = "Cape_Town"])
  [
      set SW-this-month item ticks SW-monthly

  ]
  ask patches with [landtype = 7] ; for Cape-Town
  [
    set SWD AWC - SW-this-month
    if SWD < 0 [set SWD 0]
    ifelse member? month [6 7 8 9]
    [
;      print "not irrigate"
      set irrigation-demand 0
    ]
    [
;      print "irrigate"
      set irrigation-demand SWD * 0.0254 * wine-irrigation-area  * 1000 / 1000000 ; ML
    ]
  ]
  set total-irrigation-demand-this-month total-irrigation-demand-this-month + [irrigation-demand] of one-of patches with [landtype = 7]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ask Weatherman (item 0 [who] of Weathermans with [identity = "Stellenbosch"])
  [
      set SW-this-month item ticks SW-monthly
  ]
  ask patches with [landtype = 10] ; for Stellenbosch
  [
    set SWD AWC - SW-this-month
    if SWD < 0 [set SWD 0]
    ifelse member? month [6 7 8 9]
    [
;      print "not irrigate"
      set irrigation-demand 0
    ]
    [
;      print "irrigate"
      set irrigation-demand SWD * 0.0254 * wine-irrigation-area * 1000 / 1000000 ; ML
;      print irrigation-demand
    ]
  ]
  set total-irrigation-demand-this-month total-irrigation-demand-this-month + [irrigation-demand] of one-of patches with [landtype = 10]
  set total-irrigation-demand-this-month total-irrigation-demand-this-month * Irrigation-Efficiency * item (month - 1) Kc-monthly * 0.7
;  set total-irrigation-demand-this-month total-irrigation-demand-this-month * Irrigation-Efficiency * Kc
  set total-irrigation-demand-monthly lput total-irrigation-demand-this-month total-irrigation-demand-monthly

end



to calculate-municipal-demand
  ;get water stress level
  ;determine ideal demand under different water stress level
  ;set price based on price elasticity (ideal demand)
  ;each agent calculate its water usage at each month
  set total-municipal-demand-this-month [CP-water-demand] of one-of CPers * [population] of one-of CPers

end



to allocate-water
  ;it need to be two scenarios, and based on priorities of each agent
end



to calculate-priority
  ;agriculture, compare production with previous production, and use percentage as rating
  ;energy, percentage of the max capacity
  ;water price compare to original price percentage (historical price with no stress adjust for inflation)
end

to load-rain-temp-history
  let station-name []
;  set station-name ["Cape_Point" "Cape_Town" "Ct_AWS" "Excelsior_Ceres" "Malmesbury" "Molteno_Reservoir" "Paarl"
;                    "Porterville" "Robbeneiland" "Slangkop" "Strand" "Worcester"]
  set station-name ["Breed_Valley" "Langberg" "Witzenberg" "Swartland" "Drakenstein" "Cape_Town" "Stellenbosch"]
  ; initial read in for rainfall, unit is mm/month
  ; for temp new unit is in celsius, original model input is farenheit. the mean temp is changed to celsius as well
  ; for sw is in inches
;  file-open "rainfall_history.txt"
  file-open Rain_txt
;  file-open "palmer.txt"
  let j 0
  while [not file-at-end?]
  [
    let i 1
    let rain-history []
    let next-X file-read
    let next-Y file-read
 ; one approach to read file by lines
;    print item 1 file-read-characters
;    set rain-history lput file-read-line rain-history

;the other approach to read file one by one
;    new file is from 2009 to 2100 this is 1104 time steps therefore change 121 to 1105
;    while [ i < 121 ]
    while [ i < 1105 ]    ;
    [
      let rain-i file-read
      set rain-history lput rain-i rain-history

      set i (i + 1)
;    print i
    ]
;    print rain-history
    create-Weathermans 1
    [
      set color black
      set shape "flag"
      set size 1
      set identity item j station-name
;      print identity
      setxy next-X next-Y
      set rainfall-monthly rain-history

    ]
    set j (j + 1)
  ]
  file-close

;  file-open "temperature_history.txt" ;og file-loading code

  file-open Temp_txt
  while [not file-at-end?]
  [
    let i 1
    let temp-history []
    let next-X file-read
    let next-Y file-read
 ; one approach to read file by lines
;    print item 1 file-read-characters
;    set rain-history lput file-read-line rain-history

;the other approach to read file one by one
;    while [ i < 121]
    while [ i < 1105 ]
    [
      let temp-i file-read
      set temp-history lput temp-i temp-history

      set i (i + 1)
;    print i
    ]
;    print rain-history
    ask Weathermans-on patch next-X next-Y
    [
      set temp-monthly temp-history
    ]
  ]

  file-close


;  file-open "SW_history.txt"

  file-open SW_txt
  while [not file-at-end?]
  [
    let i 1
    let SW-history []
    let next-X file-read
    let next-Y file-read
 ; one approach to read file by lines
;    print item 1 file-read-characters
;    set rain-history lput file-read-line rain-history

;the other approach to read file one by one
;    while [ i < 121]
    while [ i < 1105 ]
    [
      let SW-i file-read
      set SW-history lput SW-i SW-history

      set i (i + 1)
;    print i
    ]
;    print rain-history
    ask Weathermans-on patch next-X next-Y
    [
      set SW-monthly SW-history
    ]
  ]

  file-close

end




to build-territory
  file-open "spatial_data.txt"
  while [not file-at-end?]
  [
    let next-X file-read
    let next-Y file-read
    let next-type file-read
    ask patch next-X next-Y [set landtype next-type]
  ]
  file-close

;BR/3 stands for Berge River Reservoir, VR/4 stands for Voëlvlei
;Voëlvlei Reservoir, TR/5 stands for the Theewaterkloof Reservoir, SR/6 represents Steenbras Reservoir
ask patches
      [
        ifelse  landtype = 1 ; out of scope Else
        [set pcolor 69 ;light green
        ]
        [;do nothing
        ]

        ifelse  landtype = 2 ; ocean
        [set pcolor 96 ; ocean blue
        ]
        [;do nothing
        ]

        ifelse  landtype = 3; reservoir Berge River
        [set pcolor 85; light blue
            set capacity 130010
            set volume 115930
        ]
        [;do nothing
        ]

        ifelse  landtype = 4; reservoir Voelvlei
        [set pcolor 85; light blue
            set capacity 164095
            set volume 124100
        ]
        [;do nothing
        ]

        ifelse  landtype = 5; reservoir theewaterkloof
        [set pcolor 85; light blue
            set capacity 480188
            set volume 357963
        ]
        [;do nothing
        ]

        ifelse  landtype = 6; reservoir Steenbras Reservoir
        [set pcolor 85; light blue
            set capacity 65284
            set volume 53169
        ]
        [;do nothing
        ]

        ifelse  landtype = 7; Cape Town
        [set pcolor 65; light green
            set wine-irrigation-area 5765 * 10000 ; m^2
            set AWC 2.36 ; inch
        ]
        [;do nothing
        ]

        ifelse  landtype = 8; Swartland
        [set pcolor 27; yellow
            set wine-irrigation-area 13560 * 10000
            set AWC 2.76
        ]
        [;do nothing
        ]

        ifelse  landtype = 9; Drakenstein
        [set pcolor orange
            set wine-irrigation-area 15461 * 10000
            set AWC 2.76
        ]
        [;do nothing
        ]

        ifelse  landtype = 10; Stellenbosch
        [set pcolor 26
            set wine-irrigation-area 16286 * 10000
            set AWC 2.76
        ]
        [;do nothing
        ]

        ifelse  landtype = 11; Breede Valley
        [set pcolor 16
            set wine-irrigation-area 17199 * 10000
            set AWC 2.76
        ]
        [;do nothing
        ]

        ifelse  landtype = 12; Langeberg
        [set pcolor 15
            set wine-irrigation-area 16662 * 10000
            set AWC 2.76
        ]
        [;do nothing
        ]

        ifelse  landtype = 13; Witzenberg
        [set pcolor 14
            set wine-irrigation-area 5510 * 10000
            set AWC 2.76
        ]
        [;do nothing
        ]

  ]
end



to initialize-agents

  create-BRmanagers 1
  [
    set color yellow
    set size 1
    move-to one-of patches with [landtype = 3]
  ]

  create-VRmanagers 1
  [
    set color yellow
    set size 1
    move-to one-of patches with [landtype = 4]
  ]

    create-TRmanagers 1
  [
    set color yellow
    set size 1
    move-to one-of patches with [landtype = 5]
  ]

    create-SRmanagers 1
  [
    set color yellow
    set size 1
    move-to one-of patches with [landtype = 6]
  ]

  create-CPers 1
  [
    set color black
    move-to one-of patches with [landtype = 7]
  ]

  create-SWfarmers 1
  [
    set color black
    move-to one-of patches with [landtype = 8]
  ]

  create-Dfarmers 1
  [
    set color black
    move-to one-of patches with [landtype = 9]
  ]

  create-STfarmers 1
  [
    set color black
    move-to one-of patches with [landtype = 10]
  ]

  create-BVfarmers 1
  [
    set color black
    move-to one-of patches with [landtype = 11]
  ]

  create-Lfarmers 1
  [
    set color black
    move-to one-of patches with [landtype = 12]
  ]

  create-Wfarmers 1
  [
    set color black
    move-to one-of patches with [landtype = 13]
  ]

;  create-Ward1s 1
;  [
;    set color black
;    move-to one-of patches with [landtype = 7]
;  ]


end
@#$#@#$#@
GRAPHICS-WINDOW
210
10
624
425
-1
-1
14.0
1
10
1
1
1
0
0
0
1
0
28
-28
0
0
0
1
ticks
30.0

BUTTON
12
10
78
43
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
12
46
78
79
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
12
82
78
116
NIL
stop
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

PLOT
660
311
860
461
DAM level
Month
Level
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot V-Display"

PLOT
660
10
860
160
Power Generation
Month
KWh
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"Power-Dam" 1.0 0 -16777216 true "" "plot [actual-generation] of one-of SRmanagers"

PLOT
660
160
860
310
Ag water demand
Month
Production
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot ag-allocation-this-month"

PLOT
861
160
1061
310
Municipal Water Demand
Usage
Demand
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot mu-allocation-this-month"

PLOT
861
10
1061
160
Population
Month
Population
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot population"

BUTTON
11
119
189
152
NIL
load-rain-temp-history
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
919
315
1062
360
Irrigation Demand (ML)
item (ticks - 1 ) total-irrigation-demand-monthly
17
1
11

INPUTBOX
2
329
151
389
water-price-elasticity
-0.5
1
0
Number

SWITCH
2
236
151
269
Scenario-1?
Scenario-1?
1
1
-1000

MONITOR
919
362
1062
407
Total Allocation (ML)
item (ticks - 1) total-allocation-monthly
17
1
11

MONITOR
919
409
1062
454
Ag Allocation (ML)
item (ticks - 1) ag-allocation-monthly
17
1
11

MONITOR
919
456
1062
501
Municipal Allocation (ML)
item (ticks - 1) mu-allocation-monthly
17
1
11

MONITOR
919
503
1062
548
Total Volume (ML)
item (ticks - 1 ) V-monthly
17
1
11

MONITOR
919
550
1062
595
NIL
mu-demand
17
1
11

INPUTBOX
2
390
151
450
share-other-crops-irrigation
0.57
1
0
Number

MONITOR
919
597
1063
642
NIL
last water-price-history
17
1
11

INPUTBOX
2
517
151
577
Irrigation-Efficiency
0.7
1
0
Number

INPUTBOX
3
575
152
635
Kc
0.2
1
0
Number

INPUTBOX
2
269
152
329
sd-water-price-elasticity
0.05
1
0
Number

PLOT
456
462
656
612
Monthly domestic water usage reduction 
Month
Reduction
0.0
120.0
0.0
100.0
false
false
"" ""
PENS
"Poor" 1.0 0 -817084 true "" "plot (1 - reduction-30k) * 100"
"Less-Poor" 1.0 0 -1184463 true "" "plot (1 - reduction-57k) * 100"
"Average" 1.0 0 -13345367 true "" "plot (1 - reduction-117k) * 100"
"Rich" 1.0 0 -11221820 true "" "plot (1 - reduction-200k) * 100"

PLOT
660
462
860
612
Diff-diversified-vs-OG
NIL
NIL
0.0
120.0
0.0
1.0
false
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot model-percent-diff"

INPUTBOX
174
452
325
512
demand-increase-rate
0.009
1
0
Number

SLIDER
174
521
367
554
demand-increase-rate
demand-increase-rate
0
0.05
0.009
0.001
1
NIL
HORIZONTAL

PLOT
464
662
664
812
Monthly Water Bill
Month
Rand
0.0
120.0
0.0
100.0
true
false
"" ""
PENS
"Poor" 1.0 0 -2674135 true "" "plot bill-30k"
"Less-Poor" 1.0 0 -1184463 true "" "plot bill-57k"
"Average" 1.0 0 -14070903 true "" "plot bill-117k"
"Rich" 1.0 0 -11221820 true "" "plot bill-200k"

INPUTBOX
6
645
155
705
profit
0.04
1
0
Number

INPUTBOX
7
709
156
769
new-normal-reduction
0.02
1
0
Number

INPUTBOX
188
579
417
639
Rain_txt
Rain_history_wineland_Model2.txt
1
0
String

INPUTBOX
189
704
418
764
SW_txt
SW_history_wineland_Model1.txt
1
0
String

INPUTBOX
188
641
417
701
Temp_txt
Temp_history_wineland_Model1.txt
1
0
String

INPUTBOX
695
645
844
705
growth-rate
0.08
1
0
Number

INPUTBOX
200
783
429
843
K-price
100.0
1
0
Number

INPUTBOX
7
776
157
836
Population-ratio
1.0
1
0
Number

INPUTBOX
-1
177
148
237
Scenario
2.0
1
0
Number

INPUTBOX
3
454
152
514
water-price
0.0
1
0
Number

@#$#@#$#@
# Purpose
We build this ABM close to the reality of the stakeholders from the municipal, water, energy (hydropower), and food sector, so we have a test bed to simulate and compare the FEW system outcomes under various policy scenarios. We test two policy scenarios:
1.	Business-as-usual (baseline): no joint-management or minimal communication between the departments of Energy, Water, and Food (agriculture). The tariffs of water and threshold levels of dam storage for restrictions used in this scenario are from the city of Cape Town;

2.	Holistic-adaptive-management: allocate water resources across FEW sectors to satisfy the municipal demand, similarly for hydropower generation, and agricultural production. This scenario also Incorporate some basic climate adaption strategies and adjusting water demand using water price elasticity of demand theory to manage water shortage.

Specifically, we use the scenario 1 to calibrate and set up the baseline to match the actual patterns of the system outcomes (i.e., dam storage levels, water use) under the existing management policies. Whereas scenario 2, we propose a new holistic management strategy to optimize the outcomes of water, energy, and food sector.

We also want to compare the modeling results of different policy scenarios for a range of future climate scenarios. 

# Entities, state variables, and scales

There are five types of agents represented in this model:

1.	Water Manager (Western Cape Department of Water Services)
Allocation for each of the water user agent, total dam storage of this month, total storage capacity

2.	Energy Manager
maximum Capacity, actual apacity of this month


3.	Farmers
water demand, rainfall, temperature, soil moisture deficit and available water content of the month, Irrigation Area


4.	Citizens
water demand, population, population growth rate

The scale for the model is the city of cape town and the wine grape crop fields in Cape Wineland. The model is simulating from 2009-1 to 2018-12 for the retrofit of historic run. The time step is monthly.

# Process Overview and scheduling

The model simulates a ten-year monthly run from January 2009 to December 2018 for each of the policy scenarios at the monthly scale. The general inputs of the model include initial dam storage, monthly water inflow, monthly water demand by sectors, and water price and its price elasticity of demand (CSAG2019;  Sahin  et  al.  2016;  DWS  2018).  At the beginning of each month or tick in the model, the water manager asks the demand of each stakeholder and the check the dam level before allocation, then depends on the scenarios, the allocation for each sector is calculated accordingly. At the end of each month or tick, the dam storage is updated based on the current allocation and the inflow.

In Scenario 1, we use the restrictions set up by the city of Cape Town from 2015 to 2018. There are various levels of restrictions imposed on the study region. However, the major water use reductions occur at level 2, level 3, and level 6b, where 20\% municipal demand reduction, 30\% municipal demand reduction, and a strict 450 MLD municipal use restriction with zero agricultural water allocation are triggered when the total dam storage level is lower than 50\%, 45\%, and 20\%, respectively.

The scenario 2 takes a simple adaptive approach on imposing water use restrictions, where for each month or tick, the water manager compares the current dam storage level with the pre-drought (2009 to 2015) monthly average of dam storage level of this month. If the current dam storage level is greater than 90\% of the average, the water manager will not impose any restrictions and all stakeholders acquired their demanded water since it is in the normal range of variation. When the current dam storage level is lower than the threshold, the reduction of this month is simply the ratio of (Vavg - Vcurrent)/ Vavg. In addition, we use water price elasticity of demand so we can adjust the water price to reduce the demand to the targeted level.
After the storage has been updated, the tick advances and the loop continues until the end of tick 120 or 2018-12. 
# Design Concepts

## Emergence

Population is growing over time at an annual rate of 0.8%. 

## Adaptation
In Scenario 2, the adpation is the simple reduction if the storage level is lower than the threshold. 

## Objectives
The objective of the ABM is to optimizing the system outcomes for all the stakeholders in the model. 

## Learning
No learning if we don’t include weather forecast?  Farmers will learn to save water by use weather information.


## Prediction
Currently there is no prediction, but it is within the scope of phase 2 of this project.


## Sensing
Water managers can sense the dam storage level. Farmers can sense the rain and the temperature, and therefore the soil moisture.

## Interaction
Interactions is between the managers and the stakeholders through the demand and allocation.


## Stochasticity
In the future of phase 2, the future weather conditions is going to be a stochastic model. Potential extreme weather events. The stakeholders, instead of the current homogeneous state, will be diversified stochastically.


## Collectives
Rain, Temperature, soil moisture deficit, water price, Energy generation, Water demand and allocation of each stakeholders.


## Observation
Soil Moisture, temperature, dam storage level, porecipitation, water price.


## Initialization
The water manager will start with the upper limit of 920000 ML, and the actual storage volume at the end of 2008.


# Input data

Historic weather and inflow information. Unrestricted water demand. The soil moisture deficit was and input calculated using the tool developed by Jacobi et. al. (2013).

# Submodels
## Urban Demand Submodel
Capetonians and their urban demand is represented by a single agent, CPers. For simplicity, we aggregated the residential, commercial, and other miscellaneous water demand all together and averaged to individual urban water demand. The Cpers has 3.875 million people at the beginning of 2009 with an annual growth rate of 0.8%. In the city of Cape Town, the unrestricted individual urban water demand is calculated based on the monthly average of the urban water usage between 2009 to 2015 (CASG 2019). In all policy scenarios, the real municipal water allocation of the month is calculated using equation:

Urban Allocation = Populationi * Urban Demand * (1 - Reduction)

where $Populationi$ is the population of the year of this month, i. 


## Agriculture Submodel 
In the agricultural sub-model, the irrigation demand is calculated using the soil moisture deficit (SMD), where SMD is calculated by a simple water balance approach. We adopted the Palmer Drought Index calculating tool developed by (Jacobi 2013), which the monthly potential evapotranspiration (PET) and soil moisture content (SMC) are calculated by Thronthwaite method and by the water balance, respectively. It is a useful tool that provides relatively accurate results which have been used in agricultural research to assess drought and soil moisture (Gunda 2016,Nawagamuwa 2018). We estimated the AWC for each of the wine regions from the AWC map of the region (Schulze and Horan 2007), and the SMD was calculated by this tool using the monthly rainfall and temperature data from the closest weather station. 

In this study, we specifically focused on the irrigation of the vineyards. On average, the share of irrigation for non-wine crops is 57 % (Western Cape Government 2015). In the model, we fix the 57% of the total agricultural water usage for the non-wine crops, because those crops are mainly located outside of our study region. We only manage the water allocation of the wine grapes in this model. The irrigation of the wine grapes is calculated using equation: 

Demand of wine = SWDm * Area * KCm * Efwine

where SWDm is the soil moisture deficit of this month, Area is the irrigation area of each wine region, KCm is the Crop Coefficient of wine grapes of this month, and Efwine is the irrigation efficiency of the vineyard (WSU 2016). We calibrate the model parameters under scenario 1 to match the historical patterns. The calibrated model parameters are carried on and used in scenario 2 as well.  

## Hydropower Submodel
In the Big Six dam system, only Steenbras upper Dam is a pump-storage hydropower dam. To maintain the maximum generation capacity, the Steenbras Upper Dam needs to keep at full level (DWS 2018). The Steenbras Upper and Lower Dams operate together, where the lower dam pumps the water to the upper dam during off-peak hours, and the upper dam releases water during the peak hours that provide up to 180 mega watts (MW) to offload the pressure from the electricity grid. The storage capacities of the Steenbras Upper and Lower dams are similar, and the combinded storage accounts for 10% of the total capacity. The water supply system in Western Province cannot release water when the dam storage level is below 10% of the total capacity. Thus, we assume that if the total dam storage level is above 20% of the total dam storage capacity, the Steenbras Upper Dam can remain at full storage, and so is the maximum generation capacity. When the total dam storage level is lower than 15% of the total dam storage capacity, the water withheld in the Steenbras Upper dam will be released for the municipal water use, and no hydropower can be generated. In between 15% and 20% of the total dam storage, we assume the hydropower generation capacity decreases linearly.

 
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.0.2
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="scenario 2 price elasticity" repetitions="1" runMetricsEveryStep="true">
    <setup>setup
load-rain-temp-history</setup>
    <go>go</go>
    <metric>reduction-this-month</metric>
    <metric>energy-output-this-month</metric>
    <metric>water-price-this-month</metric>
    <metric>ag-allocation-this-month</metric>
    <metric>mu-allocation-this-month</metric>
    <metric>total-allocation-this-month</metric>
    <metric>V-display</metric>
    <metric>population</metric>
    <enumeratedValueSet variable="water-price-elasticity">
      <value value="-0.1"/>
      <value value="-0.2"/>
      <value value="-0.3"/>
      <value value="-0.4"/>
      <value value="-0.51"/>
      <value value="-0.6"/>
      <value value="-0.7"/>
      <value value="-0.8"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Irrigation-Efficiency">
      <value value="0.7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Scenario-1?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Kc">
      <value value="0.2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="share-other-crops-irrigation">
      <value value="0.57"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="water-price">
      <value value="5.2"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="scenario 1 efficiency" repetitions="1" runMetricsEveryStep="true">
    <setup>setup
load-rain-temp-history</setup>
    <go>go</go>
    <metric>reduction-this-month</metric>
    <metric>energy-output-this-month</metric>
    <metric>water-price-this-month</metric>
    <metric>ag-allocation-this-month</metric>
    <metric>mu-allocation-this-month</metric>
    <metric>total-allocation-this-month</metric>
    <metric>V-display</metric>
    <metric>population</metric>
    <steppedValueSet variable="Irrigation-Efficiency" first="0.6" step="0.01" last="0.7"/>
    <enumeratedValueSet variable="Scenario-1?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="water-price-elasticity">
      <value value="-0.51"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="share-other-crops-irrigation">
      <value value="0.57"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="water-price">
      <value value="5.2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Kc">
      <value value="0.2"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="scenario 1 share" repetitions="1" runMetricsEveryStep="true">
    <setup>setup
load-rain-temp-history</setup>
    <go>go</go>
    <metric>reduction-this-month</metric>
    <metric>energy-output-this-month</metric>
    <metric>water-price-this-month</metric>
    <metric>ag-allocation-this-month</metric>
    <metric>mu-allocation-this-month</metric>
    <metric>total-allocation-this-month</metric>
    <metric>V-display</metric>
    <metric>population</metric>
    <enumeratedValueSet variable="Irrigation-Efficiency">
      <value value="0.7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Scenario-1?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="water-price-elasticity">
      <value value="-0.3"/>
    </enumeratedValueSet>
    <steppedValueSet variable="share-other-crops-irrigation" first="0.57" step="0.02" last="0.69"/>
    <enumeratedValueSet variable="water-price">
      <value value="5.2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Kc">
      <value value="0.2"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
