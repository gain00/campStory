"""
#구글 코랩 사용시 오라클 클라이언트 설치-느낌표(!) 포함쭉~ 실행--------------

! ls -l oracle-instantclient*-basiclite-*.rpm || wget https://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient19.3-basiclite-19.3.0.0.0-1.x86_64.rpm
! ls -l oracle-instantclient*-sqlplus-*.rpm   || wget https://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient19.3-sqlplus-19.3.0.0.0-1.x86_64.rpm
! sudo apt-get install alien libaio1
! sudo alien -i oracle-instantclient19.3-basiclite-19.3.0.0.0-1.x86_64.rpm
! sudo alien -i --scripts oracle-instantclient19.3-sqlplus-19.3.0.0.0-1.x86_64.rpm
! type sqlplus
! ls -l /usr/bin/sqlplus

pip install cx_Oracle

-----------------------------------------------------------------
"""

import requests
from bs4 import BeautifulSoup
import parser
import cx_Oracle

# SQL 실행하고 결과를 담을 메모리 선언


url = "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList?serviceKey=z1YDyD%2FOYBRBVV8Gn62JLD9GmpYJirV1G5qt3ujXkz6gGjZpZ1iGhKyuHPJo0Ol%2BzqCyxEt45UPmy24%2FUyhjbQ%3D%3D&pageNo=1&numOfRows=2906&MobileOS=ETC&MobileApp=AppTest"
response = requests.get(url)
print(response)
res = response.content.decode('utf-8')
xsoup = BeautifulSoup(res, 'html.parser')

item = xsoup.find_all("item")
print(len(item))

for itn in range(len(item)):
    connection = cx_Oracle.connect("final04/final@masternull.iptime.org:1521/orcl")
    cursor = connection.cursor()
    contentid = item[itn].find('contentid')  # 콘텐츠 ID
    facltnm = item[itn].find('facltnm')  # 야영장명
    lineintro = item[itn].find('lineintro')  # 한줄소개
    intro = item[itn].find('intro')  # 소개
    allar = item[itn].find('allar')  # 전체면적
    insrncat = item[itn].find('insrncat')  # 영업배상책임보험 가입여부(Y:사용, N:미사용)
    trsagntno = item[itn].find('trsagntno')  # 관광사업자번호
    bizrno = item[itn].find('bizrno')  # 사업자번호
    facltdivnm = item[itn].find('facltdivnm')  # 사업주체.구분
    mangedivnm = item[itn].find('mangedivnm')  # 운영주체.관리주체 (직영, 위탁)
    mgcdiv = item[itn].find('mgcdiv')  # 운영기관.관리기관
    managesttus = item[itn].find('managesttus')  # 운영상태.관리상태
    hvofbgnde = item[itn].find('hvofbgnde')  # 휴장기간.휴무기간 시작일
    hvofenddle = item[itn].find('hvofenddle')  # 휴장기간.휴무기간 종료일
    featurenm = item[itn].find('featurenm')  # 특징
    induty = item[itn].find('induty')  # 업종
    lctcl = item[itn].find('lctcl')  # 입지구분
    donm = item[itn].find('donm')  # 도
    sigungunm = item[itn].find('sigungunm')  # 시군구
    zipcode = item[itn].find('zipcode')  # 우편번호
    addr1 = item[itn].find('addr1')  # 주소
    addr2 = item[itn].find('addr2')  # 주소상세
    mapx = item[itn].find('mapx')  # 경도(X)
    mapy = item[itn].find('mapy')  # 위도(Y)
    direction = item[itn].find('direction')  # 오시는 길 컨텐츠
    tel = item[itn].find('tel')  # 전화
    homepage = item[itn].find('homepage')  # 홈페이지
    resveurl = item[itn].find('resveurl')  # 예약 페이지
    resvecl = item[itn].find('resvecl')  # 예약 구분
    managenmpr = item[itn].find('managenmpr')  # 상주관리인원
    gnrlsiteco = item[itn].find('gnrlsiteco')  # 주요시설 일반야영장
    autositeco = item[itn].find('autositeco')  # 주요시설 자동차야영장
    glampsiteco = item[itn].find('glampsiteco')  # 주요시설 글램핑
    caravsiteco = item[itn].find('caravsiteco')  # 주요시설 카라반
    indvdlcaravSiteco = item[itn].find('indvdlcaravsiteco')  # 주요시설 개인 카라반
    sitedstnc = item[itn].find('sitedstnc')  # 사이트간 거리
    sitemg1width = item[itn].find('sitemg1width')  # 사이트 크기1 가로
    sitemg2width = item[itn].find('sitemg2width')  # 사이트 크기2 가로
    sitemg3width = item[itn].find('sitemg3width')  # 사이트 크기3 가로
    sitemg1vrticl = item[itn].find('sitemg1vrticl')  # 사이트 크기1 세로
    sitemg2vrticl = item[itn].find('sitemg2vrticl')  # 사이트 크기2 세로
    sitemg3vrticl = item[itn].find('sitemg3vrticl')  # 사이트 크기3 세로
    sitemg1co = item[itn].find('sitemg1co')  # 사이트 크기1 수량
    sitemg2co = item[itn].find('sitemg2co')  # 사이트 크기2 수량
    sitemg3co = item[itn].find('sitemg3co')  # 사이트 크기3 수량
    sitebottomcl1 = item[itn].find('sitebottomcl1')  # 잔디
    sitebottomcl2 = item[itn].find('sitebottomcl2')  # 파쇄석
    sitebottomcl3 = item[itn].find('sitebottomcl3')  # 테크
    sitebottomcl4 = item[itn].find('sitebottomcl4')  # 자갈
    sitebottomcl5 = item[itn].find('sitebottomcl5')  # 맨흙
    tooltip = item[itn].find('tooltip')  # 툴팁
    glampinnerfclty = item[itn].find('glampinnerfclty')  # 글램핑 - 내부시설
    caravinnerfclty = item[itn].find('caravinnerfclty')  # 카라반 - 내부시설
    prmisnde = item[itn].find('prmisnde')  # 인허가일자
    operpdcl = item[itn].find('operpdcl')  # 운영기간
    operdecl = item[itn].find('operdecl')  # 운영일
    trleracmpnyat = item[itn].find('trleracmpnyt')  # 개인 트레일러 동반 여부(Y:사용, N:미사용)
    caravacmpnyat = item[itn].find('caravacmpnyat')  # 개인 카라반 동반 여부(Y:사용, N:미사용)
    toiletco = item[itn].find('toiletco')  # 화장실 개수
    swrmco = item[itn].find('swrmco')  # 샤워실 개수
    wtrplco = item[itn].find('wtrplco')  # 개수대 개수
    braziercl = item[itn].find('braziercl')  # 화로대
    sbrscl = item[itn].find('sbrscl')  # 부대시설
    sbrsetc = item[itn].find('sbrsetc')  # 부대시설 기타
    posblfcltycl = item[itn].find('posblfcltycl')  # 주변이용가능시설
    posblfcltyetc = item[itn].find('posblfcltyetc')  # 주변이용가능시설 기타
    cltureventat = item[itn].find('cltureventat')  # 자체문화행사 여부(Y:사용, N:미사용)
    clturevent = item[itn].find('clturevent')  # 자체문화행사명
    exprnprogrmat = item[itn].find('exprnprogrmat')  # 체험프로그램 여부(Y:사용, N:미사용)
    exprnprogrm = item[itn].find('exprnprogrm')  # 체험프로그램명
    extshrco = item[itn].find('extshrco')  # 소화기 개수
    frprvtwrppco = item[itn].find('frprvtwrppco')  # 방화수 개수
    frprvtsandco = item[itn].find('frprvtsandco')  # 방화사 개수
    firesensorco = item[itn].find('firesensorco ')  # 화재감지기 개수
    themaenvrncl = item[itn].find('themaenvrncl')  # 테마환경
    eqpmnlendcl = item[itn].find('eqpmnlendcl')  # 캠핑장비대여
    animalcmgcl = item[itn].find('animalcmgcl')  # 애완동물출입
    toureracl = item[itn].find('toureracl')  # 여행시기
    firstimageurl = item[itn].find('firstimageurl')  # 대표이미지
    createdtime = item[itn].find('createdtime')  # 등록일
    modifiedtime = item[itn].find('modifiedtime')  # 수정일

    camp_info1 = [contentid, facltnm, lineintro, intro, allar, hvofbgnde, hvofenddle, featurenm, induty, lctcl, donm,
                  sigungunm, zipcode, addr1, addr2, mapx, mapy, direction, tel, homepage, resveurl, resvecl, sbrscl,
                  sbrsetc, posblfcltycl, posblfcltyetc, cltureventat, clturevent, exprnprogrmat, exprnprogrm,
                  themaenvrncl, animalcmgcl, toureracl, firstimageurl, createdtime, modifiedtime]
    camp_info2 = [contentid, managenmpr, gnrlsiteco, autositeco, glampsiteco, caravsiteco, indvdlcaravSiteco, sitedstnc,
                  sitemg1width, sitemg2width, sitemg3width, sitemg1vrticl, sitemg2vrticl, sitemg3vrticl, sitemg1co,
                  sitemg2co, sitemg3co, sitebottomcl1, sitebottomcl2, sitebottomcl3, sitebottomcl4, sitebottomcl5,
                  tooltip, glampinnerfclty, caravinnerfclty]
    camp_info3 = [contentid, prmisnde, operpdcl, operdecl, trleracmpnyat, caravacmpnyat, toiletco, swrmco, wtrplco,
                  braziercl, extshrco, frprvtwrppco, frprvtsandco, firesensorco, eqpmnlendcl, insrncat, trsagntno,
                  bizrno, facltdivnm, mangedivnm, mgcdiv, managesttus]

    for info1 in range(len(camp_info1)):
        if item[itn].find(camp_info1[info1]) != None:
            camp_info1[info1] = '0'
            continue
        else:
            camp_info1[info1] = camp_info1[info1].get_text().strip()
            continue

    for info2 in range(len(camp_info2)):
        if item[itn].find(camp_info2[info2]) != None:
            camp_info2[info2] = '0'
            continue
        else:
            camp_info2[info2] = camp_info2[info2].get_text().strip()
            continue
    for info3 in range(len(camp_info3)):
        if item[itn].find(camp_info3[info3]) != None:
            camp_info3[info3] = '0'
            continue
        else:
            camp_info3[info3] = camp_info3[info3].get_text().strip()
            continue

    if len(camp_info1[3]) >= 1333:
        camp_info1[3] = camp_info1[3][:1333]

    sql = "insert into camp_info1(contentid, facltnm, lineintro, intro, allar,hvofbgnde,hvofenddle,featurenm,induty,lctcl,donm,sigungunm,zipcode,addr1,addr2,mapx,mapy,direction,tel,homepage,resveurl,resvecl,sbrscl,sbrsetc,posblfcltycl,posblfcltyetc,cltureventat,clturevent,exprnprogrmat,exprnprogrm,themaenvrncl,animalcmgcl,toureracl,firstimageurl,createdtime,modifiedtime) values(:1,:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12,:13,:14,:15,:16,:17,:18,:19,:20,:21,:22,:23,:24,:25,:26,:27,:28,:29,:30,:31,:32,:33,:34,:35,:36)"
    cursor.execute(sql, camp_info1)

    sql2 = "insert into camp_info2(contentid,managenmpr,gnrlsiteco,autositeco,glampsiteco,caravsiteco,indvdlcaravSiteco,sitedstnc,sitemg1width,sitemg2width,sitemg3width,sitemg1vrticl,sitemg2vrticl,sitemg3vrticl,sitemg1co,sitemg2co,sitemg3co,sitebottomcl1,sitebottomcl2,sitebottomcl3,sitebottomcl4,sitebottomcl5,tooltip,glampinnerfclty,caravinnerfclty) values(:1,:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12,:13,:14,:15,:16,:17,:18,:19,:20,:21,:22,:23,:24,:25)"
    cursor.execute(sql2, camp_info2)

    sql3 = "insert into camp_info3(contentid,prmisnde,operpdcl,operdecl,trleracmpnyat,caravacmpnyat,toiletco,swrmco,wtrplco,braziercl,extshrco,frprvtwrppco,frprvtsandco,firesensorco,eqpmnlendcl,insrncat,trsagntno,bizrno,facltdivnm,mangedivnm,mgcdiv,managesttus) values(:1,:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12,:13,:14,:15,:16,:17,:18,:19,:20,:21,:22)"
    cursor.execute(sql3, camp_info3)

    cursor.close()
    connection.commit()
    connection.close()
    print(str(itn) + "번 데이터 저장완료")
print("end")