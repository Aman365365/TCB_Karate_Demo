var stats = {
    type: "GROUP",
name: "Global Information",
path: "",
pathFormatted: "group_missing-name-b06d1",
stats: {
    "name": "Global Information",
    "numberOfRequests": {
        "total": "60",
        "ok": "60",
        "ko": "0"
    },
    "minResponseTime": {
        "total": "266",
        "ok": "266",
        "ko": "-"
    },
    "maxResponseTime": {
        "total": "883",
        "ok": "883",
        "ko": "-"
    },
    "meanResponseTime": {
        "total": "420",
        "ok": "420",
        "ko": "-"
    },
    "standardDeviation": {
        "total": "145",
        "ok": "145",
        "ko": "-"
    },
    "percentiles1": {
        "total": "393",
        "ok": "393",
        "ko": "-"
    },
    "percentiles2": {
        "total": "439",
        "ok": "439",
        "ko": "-"
    },
    "percentiles3": {
        "total": "778",
        "ok": "778",
        "ko": "-"
    },
    "percentiles4": {
        "total": "866",
        "ok": "866",
        "ko": "-"
    },
    "group1": {
    "name": "t < 800 ms",
    "count": 57,
    "percentage": 95
},
    "group2": {
    "name": "800 ms < t < 1200 ms",
    "count": 3,
    "percentage": 5
},
    "group3": {
    "name": "t > 1200 ms",
    "count": 0,
    "percentage": 0
},
    "group4": {
    "name": "failed",
    "count": 0,
    "percentage": 0
},
    "meanNumberOfRequestsPerSecond": {
        "total": "2",
        "ok": "2",
        "ko": "-"
    }
},
contents: {
"req_get--public-v1--f8837": {
        type: "REQUEST",
        name: "GET /public/v1/users",
path: "GET /public/v1/users",
pathFormatted: "req_get--public-v1--f8837",
stats: {
    "name": "GET /public/v1/users",
    "numberOfRequests": {
        "total": "60",
        "ok": "60",
        "ko": "0"
    },
    "minResponseTime": {
        "total": "266",
        "ok": "266",
        "ko": "-"
    },
    "maxResponseTime": {
        "total": "883",
        "ok": "883",
        "ko": "-"
    },
    "meanResponseTime": {
        "total": "420",
        "ok": "420",
        "ko": "-"
    },
    "standardDeviation": {
        "total": "145",
        "ok": "145",
        "ko": "-"
    },
    "percentiles1": {
        "total": "393",
        "ok": "393",
        "ko": "-"
    },
    "percentiles2": {
        "total": "439",
        "ok": "439",
        "ko": "-"
    },
    "percentiles3": {
        "total": "778",
        "ok": "778",
        "ko": "-"
    },
    "percentiles4": {
        "total": "866",
        "ok": "866",
        "ko": "-"
    },
    "group1": {
    "name": "t < 800 ms",
    "count": 57,
    "percentage": 95
},
    "group2": {
    "name": "800 ms < t < 1200 ms",
    "count": 3,
    "percentage": 5
},
    "group3": {
    "name": "t > 1200 ms",
    "count": 0,
    "percentage": 0
},
    "group4": {
    "name": "failed",
    "count": 0,
    "percentage": 0
},
    "meanNumberOfRequestsPerSecond": {
        "total": "2",
        "ok": "2",
        "ko": "-"
    }
}
    }
}

}

function fillStats(stat){
    $("#numberOfRequests").append(stat.numberOfRequests.total);
    $("#numberOfRequestsOK").append(stat.numberOfRequests.ok);
    $("#numberOfRequestsKO").append(stat.numberOfRequests.ko);

    $("#minResponseTime").append(stat.minResponseTime.total);
    $("#minResponseTimeOK").append(stat.minResponseTime.ok);
    $("#minResponseTimeKO").append(stat.minResponseTime.ko);

    $("#maxResponseTime").append(stat.maxResponseTime.total);
    $("#maxResponseTimeOK").append(stat.maxResponseTime.ok);
    $("#maxResponseTimeKO").append(stat.maxResponseTime.ko);

    $("#meanResponseTime").append(stat.meanResponseTime.total);
    $("#meanResponseTimeOK").append(stat.meanResponseTime.ok);
    $("#meanResponseTimeKO").append(stat.meanResponseTime.ko);

    $("#standardDeviation").append(stat.standardDeviation.total);
    $("#standardDeviationOK").append(stat.standardDeviation.ok);
    $("#standardDeviationKO").append(stat.standardDeviation.ko);

    $("#percentiles1").append(stat.percentiles1.total);
    $("#percentiles1OK").append(stat.percentiles1.ok);
    $("#percentiles1KO").append(stat.percentiles1.ko);

    $("#percentiles2").append(stat.percentiles2.total);
    $("#percentiles2OK").append(stat.percentiles2.ok);
    $("#percentiles2KO").append(stat.percentiles2.ko);

    $("#percentiles3").append(stat.percentiles3.total);
    $("#percentiles3OK").append(stat.percentiles3.ok);
    $("#percentiles3KO").append(stat.percentiles3.ko);

    $("#percentiles4").append(stat.percentiles4.total);
    $("#percentiles4OK").append(stat.percentiles4.ok);
    $("#percentiles4KO").append(stat.percentiles4.ko);

    $("#meanNumberOfRequestsPerSecond").append(stat.meanNumberOfRequestsPerSecond.total);
    $("#meanNumberOfRequestsPerSecondOK").append(stat.meanNumberOfRequestsPerSecond.ok);
    $("#meanNumberOfRequestsPerSecondKO").append(stat.meanNumberOfRequestsPerSecond.ko);
}
