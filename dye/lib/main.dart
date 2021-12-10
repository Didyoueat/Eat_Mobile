import 'package:dye/models/shop.dart';
import 'package:dye/screens/subscribe_apply/subscribe_settings_screen.dart';
import 'package:dye/widgets/locate_based_shop_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

Map<String, dynamic> dummy = {
  "statusCode": 200,
  "shopCount": 5,
  "Shops": [
    {
      "shopId": 129,
      "businessNumber": "17-1234-0130",
      "businessName": "동묘역.롯데캐슬천지인",
      "businessPhone": "02-1234-0130",
      "dayOff": 161,
      "address": "서울특별시 강남구 도곡 129로",
      "latitude": 37.5742,
      "longitude": 127.016,
      "name": "김철수129",
      "phone": "010-1234-0130",
      "origin": null,
      "content": null,
      "imageUrl": null,
      "officeHour": "09001800",
      "temporaryDayStart": null,
      "temporaryDayEnd": null,
      "createdAt": "2021-12-07T09:36:14.079Z",
      "updatedAt": "2021-12-07T09:36:14.079Z",
      "dishes": [
        {
          "dishId": 1153,
          "shopId": 129,
          "main": true,
          "thumbnail": true,
          "title": "반찬 1",
          "content": "매콤 짭짭해요~~",
          "price": 6000,
          "count": 50,
          "weight": 600,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTgx/MDAxNjM4ODAzMDUzNTU2.rlNvZTIDppDkvlDQDE1C1FhZz-x12ciuf6DS7w7HYaMg.QN82fGrldvzV95kGytJrKbzZ8ibMJLDG8f5MA6yewSYg.PNG.singj1963/%EB%AC%B4%EB%A7%90%EB%9E%AD%EC%9D%B4.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.378Z",
          "updatedAt": "2021-12-06T15:45:53.378Z"
        },
        {
          "dishId": 1154,
          "shopId": 129,
          "main": true,
          "thumbnail": true,
          "title": "반찬 2",
          "content": "엄마가 생각나는 그 맛!",
          "price": 4000,
          "count": 70,
          "weight": 650,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfNzEg/MDAxNjM4ODAzMDUzMjg2.FcpryE2TzOc968bpGXWe6dUOs-NZEYtWZ9tYOrRodiQg.37msguApUTfp1x-kpnipS7by5FobUVw0B5PkdbeX1-4g.PNG.singj1963/%EA%B0%80%EC%A7%80%EB%B3%B6%EC%9D%8C.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.379Z",
          "updatedAt": "2021-12-06T15:45:53.379Z"
        },
        {
          "dishId": 1155,
          "shopId": 129,
          "main": true,
          "thumbnail": true,
          "title": "반찬 3",
          "content": "대중적인 반찬~!",
          "price": 2000,
          "count": 20,
          "weight": 400,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTc1/MDAxNjM4ODAzMDU0MjA2.sAbt8a2ExI5QEErO_BnwdBlaO3_FJrcxgKULIAJ3Xzog.TMnYWe_zHl5ZN_r03WRh6K8lET9JdGEQbsa__iUb-ZEg.JPEG.singj1963/%EC%A0%9C%EC%9C%A1%EB%B3%B6%EC%9D%8C.jpg?type=w773",
          "createdAt": "2021-12-06T15:45:53.381Z",
          "updatedAt": "2021-12-06T15:45:53.381Z"
        },
        {
          "dishId": 1156,
          "shopId": 129,
          "main": false,
          "thumbnail": false,
          "title": "반찬 4",
          "content": "어디가서 못먹을 맛!!",
          "price": 3000,
          "count": 25,
          "weight": 450,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTgx/MDAxNjM4ODAzMDUzNTU2.rlNvZTIDppDkvlDQDE1C1FhZz-x12ciuf6DS7w7HYaMg.QN82fGrldvzV95kGytJrKbzZ8ibMJLDG8f5MA6yewSYg.PNG.singj1963/%EB%AC%B4%EB%A7%90%EB%9E%AD%EC%9D%B4.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.382Z",
          "updatedAt": "2021-12-06T15:45:53.382Z"
        },
        {
          "dishId": 1157,
          "shopId": 129,
          "main": false,
          "thumbnail": false,
          "title": "반찬 5",
          "content": "매콤 짭짭해요~~",
          "price": 5000,
          "count": 20,
          "weight": 700,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTgx/MDAxNjM4ODAzMDUzNTU2.rlNvZTIDppDkvlDQDE1C1FhZz-x12ciuf6DS7w7HYaMg.QN82fGrldvzV95kGytJrKbzZ8ibMJLDG8f5MA6yewSYg.PNG.singj1963/%EB%AC%B4%EB%A7%90%EB%9E%AD%EC%9D%B4.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.383Z",
          "updatedAt": "2021-12-06T15:45:53.383Z"
        },
        {
          "dishId": 1158,
          "shopId": 129,
          "main": false,
          "thumbnail": false,
          "title": "반찬 6",
          "content": "아주 아삭한 반찬입니다~",
          "price": 4500,
          "count": 25,
          "weight": 700,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTc1/MDAxNjM4ODAzMDU0MjA2.sAbt8a2ExI5QEErO_BnwdBlaO3_FJrcxgKULIAJ3Xzog.TMnYWe_zHl5ZN_r03WRh6K8lET9JdGEQbsa__iUb-ZEg.JPEG.singj1963/%EC%A0%9C%EC%9C%A1%EB%B3%B6%EC%9D%8C.jpg?type=w773",
          "createdAt": "2021-12-06T15:45:53.384Z",
          "updatedAt": "2021-12-06T15:45:53.384Z"
        },
        {
          "dishId": 1159,
          "shopId": 129,
          "main": false,
          "thumbnail": false,
          "title": "반찬 7",
          "content": "단게 땡길땐 이 반찬~",
          "price": 6500,
          "count": 55,
          "weight": 200,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMjEx/MDAxNjM4ODAzMDUzNDEz.Yw9z-n1WcgFdWzgfjCXDlX5MOs5nHcr92vKspBDE5hwg.ooHD56vCUD5pDgIuHaYuwOEIv_V119JjHt-OjT2vT2Yg.PNG.singj1963/%EA%B3%A0%EC%82%AC%EB%A6%AC%EB%B3%B6%EC%9D%8C.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.385Z",
          "updatedAt": "2021-12-06T15:45:53.385Z"
        },
        {
          "dishId": 1160,
          "shopId": 129,
          "main": false,
          "thumbnail": false,
          "title": "반찬 8",
          "content": "대중적인 반찬~!",
          "price": 7000,
          "count": 60,
          "weight": 500,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMjYz/MDAxNjM4ODAzMDUzNjQ2.VaKUblEZy9KQCaBNkkFSKveZji_EbtN7tvDE4djMjwcg.LfaQSbsCHnVntF_XFi0xwhrInAFVZbmYMHURYiXu12Mg.JPEG.singj1963/%EB%A9%94%EB%B0%80%EC%A0%84%EB%B3%91.jpg?type=w773",
          "createdAt": "2021-12-06T15:45:53.386Z",
          "updatedAt": "2021-12-06T15:45:53.386Z"
        },
        {
          "dishId": 1161,
          "shopId": 129,
          "main": false,
          "thumbnail": false,
          "title": "반찬 9",
          "content": "재 주문율 111%",
          "price": 3500,
          "count": 70,
          "weight": 300,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfNzEg/MDAxNjM4ODAzMDUzMjg2.FcpryE2TzOc968bpGXWe6dUOs-NZEYtWZ9tYOrRodiQg.37msguApUTfp1x-kpnipS7by5FobUVw0B5PkdbeX1-4g.PNG.singj1963/%EA%B0%80%EC%A7%80%EB%B3%B6%EC%9D%8C.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.387Z",
          "updatedAt": "2021-12-06T15:45:53.387Z"
        }
      ],
      "distance": 11
    },
    {
      "shopId": 123,
      "businessNumber": "17-1234-0124",
      "businessName": "종로구민회관.창신동두산아파트",
      "businessPhone": "02-1234-0124",
      "dayOff": 127,
      "address": "서울특별시 강남구 도곡 123로",
      "latitude": 37.5741,
      "longitude": 127.016,
      "name": "김철수123",
      "phone": "010-1234-0124",
      "origin": null,
      "content": null,
      "imageUrl": null,
      "officeHour": "09001800",
      "temporaryDayStart": null,
      "temporaryDayEnd": null,
      "createdAt": "2021-12-07T09:36:14.076Z",
      "updatedAt": "2021-12-07T09:36:14.076Z",
      "dishes": [
        {
          "dishId": 1099,
          "shopId": 123,
          "main": true,
          "thumbnail": true,
          "title": "반찬 1",
          "content": "엄마가 생각나는 그 맛!",
          "price": 2500,
          "count": 25,
          "weight": 600,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMjYz/MDAxNjM4ODAzMDUzNjQ2.VaKUblEZy9KQCaBNkkFSKveZji_EbtN7tvDE4djMjwcg.LfaQSbsCHnVntF_XFi0xwhrInAFVZbmYMHURYiXu12Mg.JPEG.singj1963/%EB%A9%94%EB%B0%80%EC%A0%84%EB%B3%91.jpg?type=w773",
          "createdAt": "2021-12-06T15:45:53.320Z",
          "updatedAt": "2021-12-06T15:45:53.320Z"
        },
        {
          "dishId": 1100,
          "shopId": 123,
          "main": true,
          "thumbnail": true,
          "title": "반찬 2",
          "content": "대중적인 반찬~!",
          "price": 5000,
          "count": 55,
          "weight": 650,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTgx/MDAxNjM4ODAzMDUzNTU2.rlNvZTIDppDkvlDQDE1C1FhZz-x12ciuf6DS7w7HYaMg.QN82fGrldvzV95kGytJrKbzZ8ibMJLDG8f5MA6yewSYg.PNG.singj1963/%EB%AC%B4%EB%A7%90%EB%9E%AD%EC%9D%B4.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.321Z",
          "updatedAt": "2021-12-06T15:45:53.321Z"
        },
        {
          "dishId": 1101,
          "shopId": 123,
          "main": true,
          "thumbnail": true,
          "title": "반찬 3",
          "content": "단게 땡길땐 이 반찬~",
          "price": 3000,
          "count": 30,
          "weight": 350,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTYg/MDAxNjM4ODAzMDUzNDg3.BMiG8SFjIh98yT-oEqnalzFwjIIeh5UMXF14E6os6cIg.p3lkvZ_vf_S7CnxX5MlDQeA7ohiJbc8CFkhfwMbYkesg.PNG.singj1963/%EC%98%A4%EC%9D%B4%EC%86%8C%EB%B0%95%EC%9D%B4.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.322Z",
          "updatedAt": "2021-12-06T15:45:53.322Z"
        },
        {
          "dishId": 1102,
          "shopId": 123,
          "main": false,
          "thumbnail": false,
          "title": "반찬 4",
          "content": "어디가서 못먹을 맛!!",
          "price": 4500,
          "count": 50,
          "weight": 300,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMjEx/MDAxNjM4ODAzMDUzNDEz.Yw9z-n1WcgFdWzgfjCXDlX5MOs5nHcr92vKspBDE5hwg.ooHD56vCUD5pDgIuHaYuwOEIv_V119JjHt-OjT2vT2Yg.PNG.singj1963/%EA%B3%A0%EC%82%AC%EB%A6%AC%EB%B3%B6%EC%9D%8C.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.325Z",
          "updatedAt": "2021-12-06T15:45:53.325Z"
        },
        {
          "dishId": 1103,
          "shopId": 123,
          "main": false,
          "thumbnail": false,
          "title": "반찬 5",
          "content": "어린아이가 좋아해요",
          "price": 3000,
          "count": 20,
          "weight": 700,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTU2/MDAxNjM4ODAzMDUzOTE3.WIIwG9ALaAkaPOFob1vCDiE6qEURqI8fsDgXvYB1aQgg.NBkt9Ukpueuu7c6hO9zoNtj7IXXLA1QXtsMz25ZrFv8g.PNG.singj1963/%EC%8B%9C%EA%B8%88%EC%B9%98%EB%AC%B4%EC%B9%A8.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.326Z",
          "updatedAt": "2021-12-06T15:45:53.326Z"
        },
        {
          "dishId": 1104,
          "shopId": 123,
          "main": false,
          "thumbnail": false,
          "title": "반찬 6",
          "content": "어디가서 못먹을 맛!!",
          "price": 6500,
          "count": 60,
          "weight": 400,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMjgx/MDAxNjM4ODAzMDU0Mzc2.HDXshBBW0GYM5RcMYlfatB6GbO5-7pvTfsRo5ETtkCog.6cupvUUQg5U4juJwJuEOD07VNEq0F-dX_ZIHNBMdOcQg.PNG.singj1963/%EC%BD%A9%EB%82%98%EB%AC%BC%EB%AC%B4%EC%B9%A8.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.327Z",
          "updatedAt": "2021-12-06T15:45:53.327Z"
        },
        {
          "dishId": 1105,
          "shopId": 123,
          "main": false,
          "thumbnail": false,
          "title": "반찬 7",
          "content": "어디가서 못먹을 맛!!",
          "price": 4500,
          "count": 60,
          "weight": 350,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTYg/MDAxNjM4ODAzMDUzNDg3.BMiG8SFjIh98yT-oEqnalzFwjIIeh5UMXF14E6os6cIg.p3lkvZ_vf_S7CnxX5MlDQeA7ohiJbc8CFkhfwMbYkesg.PNG.singj1963/%EC%98%A4%EC%9D%B4%EC%86%8C%EB%B0%95%EC%9D%B4.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.328Z",
          "updatedAt": "2021-12-06T15:45:53.328Z"
        },
        {
          "dishId": 1106,
          "shopId": 123,
          "main": false,
          "thumbnail": false,
          "title": "반찬 8",
          "content": "대중적인 반찬~!",
          "price": 3000,
          "count": 40,
          "weight": 500,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfNyAg/MDAxNjM4ODAzMDUzNzEw.BiEqas64eyldpkGJaRFrSF4gTFjezN8-KSEHsP0jjj4g.I50-74zGX91z3Rb0Nfd6NsE-_bVOoiDgzdGsl4DqTm4g.JPEG.singj1963/%EA%B0%84%EC%9E%A5%EA%B2%8C%EC%9E%A5.jpg?type=w773",
          "createdAt": "2021-12-06T15:45:53.329Z",
          "updatedAt": "2021-12-06T15:45:53.329Z"
        },
        {
          "dishId": 1107,
          "shopId": 123,
          "main": false,
          "thumbnail": false,
          "title": "반찬 9",
          "content": "엄마가 생각나는 그 맛!",
          "price": 4500,
          "count": 50,
          "weight": 650,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTYg/MDAxNjM4ODAzMDUzNDg3.BMiG8SFjIh98yT-oEqnalzFwjIIeh5UMXF14E6os6cIg.p3lkvZ_vf_S7CnxX5MlDQeA7ohiJbc8CFkhfwMbYkesg.PNG.singj1963/%EC%98%A4%EC%9D%B4%EC%86%8C%EB%B0%95%EC%9D%B4.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.331Z",
          "updatedAt": "2021-12-06T15:45:53.331Z"
        }
      ],
      "distance": 0
    },
    {
      "shopId": 25,
      "businessNumber": "17-1234-0026",
      "businessName": "동묘앞",
      "businessPhone": "02-1234-0026",
      "dayOff": 18,
      "address": "서울특별시 강남구 도곡 25로",
      "latitude": 37.5734,
      "longitude": 127.018,
      "name": "김철수25",
      "phone": "010-1234-0026",
      "origin": null,
      "content": null,
      "imageUrl": null,
      "officeHour": "09001800",
      "temporaryDayStart": null,
      "temporaryDayEnd": null,
      "createdAt": "2021-12-07T09:36:14.009Z",
      "updatedAt": "2021-12-07T09:36:14.009Z",
      "dishes": [
        {
          "dishId": 217,
          "shopId": 25,
          "main": true,
          "thumbnail": true,
          "title": "반찬 1",
          "content": "매콤 짭짭해요~~",
          "price": 2000,
          "count": 65,
          "weight": 300,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfNyAg/MDAxNjM4ODAzMDUzNzEw.BiEqas64eyldpkGJaRFrSF4gTFjezN8-KSEHsP0jjj4g.I50-74zGX91z3Rb0Nfd6NsE-_bVOoiDgzdGsl4DqTm4g.JPEG.singj1963/%EA%B0%84%EC%9E%A5%EA%B2%8C%EC%9E%A5.jpg?type=w773",
          "createdAt": "2021-12-06T15:45:52.086Z",
          "updatedAt": "2021-12-06T15:45:52.086Z"
        },
        {
          "dishId": 218,
          "shopId": 25,
          "main": true,
          "thumbnail": true,
          "title": "반찬 2",
          "content": "어디가서 못먹을 맛!!",
          "price": 5500,
          "count": 35,
          "weight": 700,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTYg/MDAxNjM4ODAzMDUzNDg3.BMiG8SFjIh98yT-oEqnalzFwjIIeh5UMXF14E6os6cIg.p3lkvZ_vf_S7CnxX5MlDQeA7ohiJbc8CFkhfwMbYkesg.PNG.singj1963/%EC%98%A4%EC%9D%B4%EC%86%8C%EB%B0%95%EC%9D%B4.png?type=w773",
          "createdAt": "2021-12-06T15:45:52.087Z",
          "updatedAt": "2021-12-06T15:45:52.087Z"
        },
        {
          "dishId": 219,
          "shopId": 25,
          "main": true,
          "thumbnail": true,
          "title": "반찬 3",
          "content": "어디가서 못먹을 맛!!",
          "price": 2500,
          "count": 35,
          "weight": 550,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfNzEg/MDAxNjM4ODAzMDUzMjg2.FcpryE2TzOc968bpGXWe6dUOs-NZEYtWZ9tYOrRodiQg.37msguApUTfp1x-kpnipS7by5FobUVw0B5PkdbeX1-4g.PNG.singj1963/%EA%B0%80%EC%A7%80%EB%B3%B6%EC%9D%8C.png?type=w773",
          "createdAt": "2021-12-06T15:45:52.088Z",
          "updatedAt": "2021-12-06T15:45:52.088Z"
        },
        {
          "dishId": 220,
          "shopId": 25,
          "main": false,
          "thumbnail": false,
          "title": "반찬 4",
          "content": "아주 아삭한 반찬입니다~",
          "price": 6500,
          "count": 45,
          "weight": 400,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfNzEg/MDAxNjM4ODAzMDUzMjg2.FcpryE2TzOc968bpGXWe6dUOs-NZEYtWZ9tYOrRodiQg.37msguApUTfp1x-kpnipS7by5FobUVw0B5PkdbeX1-4g.PNG.singj1963/%EA%B0%80%EC%A7%80%EB%B3%B6%EC%9D%8C.png?type=w773",
          "createdAt": "2021-12-06T15:45:52.089Z",
          "updatedAt": "2021-12-06T15:45:52.089Z"
        },
        {
          "dishId": 221,
          "shopId": 25,
          "main": false,
          "thumbnail": false,
          "title": "반찬 5",
          "content": "대중적인 반찬~!",
          "price": 2000,
          "count": 35,
          "weight": 300,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTgx/MDAxNjM4ODAzMDUzNTU2.rlNvZTIDppDkvlDQDE1C1FhZz-x12ciuf6DS7w7HYaMg.QN82fGrldvzV95kGytJrKbzZ8ibMJLDG8f5MA6yewSYg.PNG.singj1963/%EB%AC%B4%EB%A7%90%EB%9E%AD%EC%9D%B4.png?type=w773",
          "createdAt": "2021-12-06T15:45:52.091Z",
          "updatedAt": "2021-12-06T15:45:52.091Z"
        },
        {
          "dishId": 222,
          "shopId": 25,
          "main": false,
          "thumbnail": false,
          "title": "반찬 6",
          "content": "매콤 짭짭해요~~",
          "price": 3500,
          "count": 35,
          "weight": 450,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMjYz/MDAxNjM4ODAzMDUzNjQ2.VaKUblEZy9KQCaBNkkFSKveZji_EbtN7tvDE4djMjwcg.LfaQSbsCHnVntF_XFi0xwhrInAFVZbmYMHURYiXu12Mg.JPEG.singj1963/%EB%A9%94%EB%B0%80%EC%A0%84%EB%B3%91.jpg?type=w773",
          "createdAt": "2021-12-06T15:45:52.092Z",
          "updatedAt": "2021-12-06T15:45:52.092Z"
        },
        {
          "dishId": 223,
          "shopId": 25,
          "main": false,
          "thumbnail": false,
          "title": "반찬 7",
          "content": "엄마가 생각나는 그 맛!",
          "price": 2000,
          "count": 65,
          "weight": 350,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMjEx/MDAxNjM4ODAzMDUzNDEz.Yw9z-n1WcgFdWzgfjCXDlX5MOs5nHcr92vKspBDE5hwg.ooHD56vCUD5pDgIuHaYuwOEIv_V119JjHt-OjT2vT2Yg.PNG.singj1963/%EA%B3%A0%EC%82%AC%EB%A6%AC%EB%B3%B6%EC%9D%8C.png?type=w773",
          "createdAt": "2021-12-06T15:45:52.093Z",
          "updatedAt": "2021-12-06T15:45:52.093Z"
        },
        {
          "dishId": 224,
          "shopId": 25,
          "main": false,
          "thumbnail": false,
          "title": "반찬 8",
          "content": "어디가서 못먹을 맛!!",
          "price": 3500,
          "count": 30,
          "weight": 700,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfNyAg/MDAxNjM4ODAzMDUzNzEw.BiEqas64eyldpkGJaRFrSF4gTFjezN8-KSEHsP0jjj4g.I50-74zGX91z3Rb0Nfd6NsE-_bVOoiDgzdGsl4DqTm4g.JPEG.singj1963/%EA%B0%84%EC%9E%A5%EA%B2%8C%EC%9E%A5.jpg?type=w773",
          "createdAt": "2021-12-06T15:45:52.094Z",
          "updatedAt": "2021-12-06T15:45:52.094Z"
        },
        {
          "dishId": 225,
          "shopId": 25,
          "main": false,
          "thumbnail": false,
          "title": "반찬 9",
          "content": "아주 아삭한 반찬입니다~",
          "price": 6000,
          "count": 30,
          "weight": 450,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfNzEg/MDAxNjM4ODAzMDUzMjg2.FcpryE2TzOc968bpGXWe6dUOs-NZEYtWZ9tYOrRodiQg.37msguApUTfp1x-kpnipS7by5FobUVw0B5PkdbeX1-4g.PNG.singj1963/%EA%B0%80%EC%A7%80%EB%B3%B6%EC%9D%8C.png?type=w773",
          "createdAt": "2021-12-06T15:45:52.095Z",
          "updatedAt": "2021-12-06T15:45:52.095Z"
        }
      ],
      "distance": 192
    },
    {
      "shopId": 131,
      "businessNumber": "17-1234-0132",
      "businessName": "동묘앞",
      "businessPhone": "02-1234-0132",
      "dayOff": 174,
      "address": "서울특별시 강남구 도곡 131로",
      "latitude": 37.5737,
      "longitude": 127.018,
      "name": "김철수131",
      "phone": "010-1234-0132",
      "origin": null,
      "content": null,
      "imageUrl": null,
      "officeHour": "09001800",
      "temporaryDayStart": null,
      "temporaryDayEnd": null,
      "createdAt": "2021-12-07T09:36:14.082Z",
      "updatedAt": "2021-12-07T09:36:14.082Z",
      "dishes": [
        {
          "dishId": 1171,
          "shopId": 131,
          "main": true,
          "thumbnail": true,
          "title": "반찬 1",
          "content": "단게 땡길땐 이 반찬~",
          "price": 5000,
          "count": 30,
          "weight": 550,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTYg/MDAxNjM4ODAzMDUzNDg3.BMiG8SFjIh98yT-oEqnalzFwjIIeh5UMXF14E6os6cIg.p3lkvZ_vf_S7CnxX5MlDQeA7ohiJbc8CFkhfwMbYkesg.PNG.singj1963/%EC%98%A4%EC%9D%B4%EC%86%8C%EB%B0%95%EC%9D%B4.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.397Z",
          "updatedAt": "2021-12-06T15:45:53.397Z"
        },
        {
          "dishId": 1172,
          "shopId": 131,
          "main": true,
          "thumbnail": true,
          "title": "반찬 2",
          "content": "단게 땡길땐 이 반찬~",
          "price": 7000,
          "count": 50,
          "weight": 300,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMjYz/MDAxNjM4ODAzMDUzNjQ2.VaKUblEZy9KQCaBNkkFSKveZji_EbtN7tvDE4djMjwcg.LfaQSbsCHnVntF_XFi0xwhrInAFVZbmYMHURYiXu12Mg.JPEG.singj1963/%EB%A9%94%EB%B0%80%EC%A0%84%EB%B3%91.jpg?type=w773",
          "createdAt": "2021-12-06T15:45:53.398Z",
          "updatedAt": "2021-12-06T15:45:53.398Z"
        },
        {
          "dishId": 1173,
          "shopId": 131,
          "main": true,
          "thumbnail": true,
          "title": "반찬 3",
          "content": "어린아이가 좋아해요",
          "price": 6000,
          "count": 50,
          "weight": 350,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTc1/MDAxNjM4ODAzMDU0MjA2.sAbt8a2ExI5QEErO_BnwdBlaO3_FJrcxgKULIAJ3Xzog.TMnYWe_zHl5ZN_r03WRh6K8lET9JdGEQbsa__iUb-ZEg.JPEG.singj1963/%EC%A0%9C%EC%9C%A1%EB%B3%B6%EC%9D%8C.jpg?type=w773",
          "createdAt": "2021-12-06T15:45:53.399Z",
          "updatedAt": "2021-12-06T15:45:53.399Z"
        },
        {
          "dishId": 1174,
          "shopId": 131,
          "main": false,
          "thumbnail": false,
          "title": "반찬 4",
          "content": "엄마가 생각나는 그 맛!",
          "price": 4500,
          "count": 55,
          "weight": 300,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfNzEg/MDAxNjM4ODAzMDUzMjg2.FcpryE2TzOc968bpGXWe6dUOs-NZEYtWZ9tYOrRodiQg.37msguApUTfp1x-kpnipS7by5FobUVw0B5PkdbeX1-4g.PNG.singj1963/%EA%B0%80%EC%A7%80%EB%B3%B6%EC%9D%8C.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.400Z",
          "updatedAt": "2021-12-06T15:45:53.400Z"
        },
        {
          "dishId": 1175,
          "shopId": 131,
          "main": false,
          "thumbnail": false,
          "title": "반찬 5",
          "content": "아주 아삭한 반찬입니다~",
          "price": 6500,
          "count": 35,
          "weight": 600,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTYg/MDAxNjM4ODAzMDUzNDg3.BMiG8SFjIh98yT-oEqnalzFwjIIeh5UMXF14E6os6cIg.p3lkvZ_vf_S7CnxX5MlDQeA7ohiJbc8CFkhfwMbYkesg.PNG.singj1963/%EC%98%A4%EC%9D%B4%EC%86%8C%EB%B0%95%EC%9D%B4.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.401Z",
          "updatedAt": "2021-12-06T15:45:53.401Z"
        },
        {
          "dishId": 1176,
          "shopId": 131,
          "main": false,
          "thumbnail": false,
          "title": "반찬 6",
          "content": "재 주문율 111%",
          "price": 3500,
          "count": 20,
          "weight": 400,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMjEx/MDAxNjM4ODAzMDUzNDEz.Yw9z-n1WcgFdWzgfjCXDlX5MOs5nHcr92vKspBDE5hwg.ooHD56vCUD5pDgIuHaYuwOEIv_V119JjHt-OjT2vT2Yg.PNG.singj1963/%EA%B3%A0%EC%82%AC%EB%A6%AC%EB%B3%B6%EC%9D%8C.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.402Z",
          "updatedAt": "2021-12-06T15:45:53.402Z"
        },
        {
          "dishId": 1177,
          "shopId": 131,
          "main": false,
          "thumbnail": false,
          "title": "반찬 7",
          "content": "단게 땡길땐 이 반찬~",
          "price": 2000,
          "count": 60,
          "weight": 650,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTYg/MDAxNjM4ODAzMDUzNDg3.BMiG8SFjIh98yT-oEqnalzFwjIIeh5UMXF14E6os6cIg.p3lkvZ_vf_S7CnxX5MlDQeA7ohiJbc8CFkhfwMbYkesg.PNG.singj1963/%EC%98%A4%EC%9D%B4%EC%86%8C%EB%B0%95%EC%9D%B4.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.403Z",
          "updatedAt": "2021-12-06T15:45:53.403Z"
        },
        {
          "dishId": 1178,
          "shopId": 131,
          "main": false,
          "thumbnail": false,
          "title": "반찬 8",
          "content": "단게 땡길땐 이 반찬~",
          "price": 2000,
          "count": 40,
          "weight": 600,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfNzEg/MDAxNjM4ODAzMDUzMjg2.FcpryE2TzOc968bpGXWe6dUOs-NZEYtWZ9tYOrRodiQg.37msguApUTfp1x-kpnipS7by5FobUVw0B5PkdbeX1-4g.PNG.singj1963/%EA%B0%80%EC%A7%80%EB%B3%B6%EC%9D%8C.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.404Z",
          "updatedAt": "2021-12-06T15:45:53.404Z"
        },
        {
          "dishId": 1179,
          "shopId": 131,
          "main": false,
          "thumbnail": false,
          "title": "반찬 9",
          "content": "매콤 짭짭해요~~",
          "price": 4500,
          "count": 20,
          "weight": 600,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMjEx/MDAxNjM4ODAzMDUzNDEz.Yw9z-n1WcgFdWzgfjCXDlX5MOs5nHcr92vKspBDE5hwg.ooHD56vCUD5pDgIuHaYuwOEIv_V119JjHt-OjT2vT2Yg.PNG.singj1963/%EA%B3%A0%EC%82%AC%EB%A6%AC%EB%B3%B6%EC%9D%8C.png?type=w773",
          "createdAt": "2021-12-06T15:45:53.405Z",
          "updatedAt": "2021-12-06T15:45:53.405Z"
        }
      ],
      "distance": 181
    },
    {
      "shopId": 369,
      "businessNumber": "17-1234-0370",
      "businessName": "동묘.숭인동도깨비시장",
      "businessPhone": "02-1234-0370",
      "dayOff": 18,
      "address": "서울특별시 강남구 도곡 369로",
      "latitude": 37.5736,
      "longitude": 127.018,
      "name": "김철수369",
      "phone": "010-1234-0370",
      "origin": null,
      "content": null,
      "imageUrl": null,
      "officeHour": "09001800",
      "temporaryDayStart": null,
      "temporaryDayEnd": null,
      "createdAt": "2021-12-07T09:36:14.225Z",
      "updatedAt": "2021-12-07T09:36:14.225Z",
      "dishes": [
        {
          "dishId": 3313,
          "shopId": 369,
          "main": true,
          "thumbnail": true,
          "title": "반찬 1",
          "content": "엄마가 생각나는 그 맛!",
          "price": 6000,
          "count": 45,
          "weight": 550,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTYg/MDAxNjM4ODAzMDUzNDg3.BMiG8SFjIh98yT-oEqnalzFwjIIeh5UMXF14E6os6cIg.p3lkvZ_vf_S7CnxX5MlDQeA7ohiJbc8CFkhfwMbYkesg.PNG.singj1963/%EC%98%A4%EC%9D%B4%EC%86%8C%EB%B0%95%EC%9D%B4.png?type=w773",
          "createdAt": "2021-12-06T15:45:55.589Z",
          "updatedAt": "2021-12-06T15:45:55.589Z"
        },
        {
          "dishId": 3314,
          "shopId": 369,
          "main": true,
          "thumbnail": true,
          "title": "반찬 2",
          "content": "어디가서 못먹을 맛!!",
          "price": 4000,
          "count": 20,
          "weight": 300,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTc1/MDAxNjM4ODAzMDU0MjA2.sAbt8a2ExI5QEErO_BnwdBlaO3_FJrcxgKULIAJ3Xzog.TMnYWe_zHl5ZN_r03WRh6K8lET9JdGEQbsa__iUb-ZEg.JPEG.singj1963/%EC%A0%9C%EC%9C%A1%EB%B3%B6%EC%9D%8C.jpg?type=w773",
          "createdAt": "2021-12-06T15:45:55.590Z",
          "updatedAt": "2021-12-06T15:45:55.590Z"
        },
        {
          "dishId": 3315,
          "shopId": 369,
          "main": true,
          "thumbnail": true,
          "title": "반찬 3",
          "content": "아주 아삭한 반찬입니다~",
          "price": 5000,
          "count": 60,
          "weight": 600,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMjYz/MDAxNjM4ODAzMDUzNjQ2.VaKUblEZy9KQCaBNkkFSKveZji_EbtN7tvDE4djMjwcg.LfaQSbsCHnVntF_XFi0xwhrInAFVZbmYMHURYiXu12Mg.JPEG.singj1963/%EB%A9%94%EB%B0%80%EC%A0%84%EB%B3%91.jpg?type=w773",
          "createdAt": "2021-12-06T15:45:55.591Z",
          "updatedAt": "2021-12-06T15:45:55.591Z"
        },
        {
          "dishId": 3316,
          "shopId": 369,
          "main": false,
          "thumbnail": false,
          "title": "반찬 4",
          "content": "엄마가 생각나는 그 맛!",
          "price": 2500,
          "count": 40,
          "weight": 200,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTgx/MDAxNjM4ODAzMDUzNTU2.rlNvZTIDppDkvlDQDE1C1FhZz-x12ciuf6DS7w7HYaMg.QN82fGrldvzV95kGytJrKbzZ8ibMJLDG8f5MA6yewSYg.PNG.singj1963/%EB%AC%B4%EB%A7%90%EB%9E%AD%EC%9D%B4.png?type=w773",
          "createdAt": "2021-12-06T15:45:55.592Z",
          "updatedAt": "2021-12-06T15:45:55.592Z"
        },
        {
          "dishId": 3317,
          "shopId": 369,
          "main": false,
          "thumbnail": false,
          "title": "반찬 5",
          "content": "대중적인 반찬~!",
          "price": 3000,
          "count": 20,
          "weight": 500,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMjgx/MDAxNjM4ODAzMDU0Mzc2.HDXshBBW0GYM5RcMYlfatB6GbO5-7pvTfsRo5ETtkCog.6cupvUUQg5U4juJwJuEOD07VNEq0F-dX_ZIHNBMdOcQg.PNG.singj1963/%EC%BD%A9%EB%82%98%EB%AC%BC%EB%AC%B4%EC%B9%A8.png?type=w773",
          "createdAt": "2021-12-06T15:45:55.593Z",
          "updatedAt": "2021-12-06T15:45:55.593Z"
        },
        {
          "dishId": 3318,
          "shopId": 369,
          "main": false,
          "thumbnail": false,
          "title": "반찬 6",
          "content": "단게 땡길땐 이 반찬~",
          "price": 3500,
          "count": 30,
          "weight": 650,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTU2/MDAxNjM4ODAzMDUzOTE3.WIIwG9ALaAkaPOFob1vCDiE6qEURqI8fsDgXvYB1aQgg.NBkt9Ukpueuu7c6hO9zoNtj7IXXLA1QXtsMz25ZrFv8g.PNG.singj1963/%EC%8B%9C%EA%B8%88%EC%B9%98%EB%AC%B4%EC%B9%A8.png?type=w773",
          "createdAt": "2021-12-06T15:45:55.594Z",
          "updatedAt": "2021-12-06T15:45:55.594Z"
        },
        {
          "dishId": 3319,
          "shopId": 369,
          "main": false,
          "thumbnail": false,
          "title": "반찬 7",
          "content": "아주 아삭한 반찬입니다~",
          "price": 3500,
          "count": 35,
          "weight": 400,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfNyAg/MDAxNjM4ODAzMDUzNzEw.BiEqas64eyldpkGJaRFrSF4gTFjezN8-KSEHsP0jjj4g.I50-74zGX91z3Rb0Nfd6NsE-_bVOoiDgzdGsl4DqTm4g.JPEG.singj1963/%EA%B0%84%EC%9E%A5%EA%B2%8C%EC%9E%A5.jpg?type=w773",
          "createdAt": "2021-12-06T15:45:55.595Z",
          "updatedAt": "2021-12-06T15:45:55.595Z"
        },
        {
          "dishId": 3320,
          "shopId": 369,
          "main": false,
          "thumbnail": false,
          "title": "반찬 8",
          "content": "엄마가 생각나는 그 맛!",
          "price": 5000,
          "count": 45,
          "weight": 700,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTYg/MDAxNjM4ODAzMDUzNDg3.BMiG8SFjIh98yT-oEqnalzFwjIIeh5UMXF14E6os6cIg.p3lkvZ_vf_S7CnxX5MlDQeA7ohiJbc8CFkhfwMbYkesg.PNG.singj1963/%EC%98%A4%EC%9D%B4%EC%86%8C%EB%B0%95%EC%9D%B4.png?type=w773",
          "createdAt": "2021-12-06T15:45:55.596Z",
          "updatedAt": "2021-12-06T15:45:55.596Z"
        },
        {
          "dishId": 3321,
          "shopId": 369,
          "main": false,
          "thumbnail": false,
          "title": "반찬 9",
          "content": "아주 아삭한 반찬입니다~",
          "price": 4500,
          "count": 40,
          "weight": 250,
          "imageUrl":
              "https://postfiles.pstatic.net/MjAyMTEyMDdfNyAg/MDAxNjM4ODAzMDUzNzEw.BiEqas64eyldpkGJaRFrSF4gTFjezN8-KSEHsP0jjj4g.I50-74zGX91z3Rb0Nfd6NsE-_bVOoiDgzdGsl4DqTm4g.JPEG.singj1963/%EA%B0%84%EC%9E%A5%EA%B2%8C%EC%9E%A5.jpg?type=w773",
          "createdAt": "2021-12-06T15:45:55.597Z",
          "updatedAt": "2021-12-06T15:45:55.597Z"
        }
      ],
      "distance": 184
    }
  ]
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final temp = <Shop>[];
    if (dummy['Shops'] != null) {
      dummy['Shops'].forEach((v) {
        temp.add(Shop.fromJson(v));
      });
    }

    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        title: 'Flutter Demo',

        theme: ThemeData(
          fontFamily: "Noto_Sans_KR",
          primarySwatch: Colors.blue,
          primaryColor: Color(0xffff5439),
        ),
        // home: const ApplySubscribeSettings(),
        home: Scaffold(
          body: SafeArea(
            child: Container(
              // padding: EdgeInsets.only(left: 20.w, right: 20.w),
              color: Colors.white,
              child: LocateBasedShopList(
                list: temp,
                isInSubscribe: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
