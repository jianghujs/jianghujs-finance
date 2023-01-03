const fs = require('fs');
const path = require('path');
const _ = require('lodash');

async function generateSubjectInsertSql() {
    const subject1 = require('./1.资产.json');
    const subject2 = require('./2.负债.json');
    const subject3 = require('./3.权益.json');
    const subject4 = require('./4.成本.json');
    const subject5 = require('./5.损益.json');
    let subjectList = subject1.data
        .concat(subject2.data)
        .concat(subject3.data)
        .concat(subject4.data)
        .concat(subject5.data);
    const subjectCategoryObj = {
        1: '资产', 2: '负债', 3: '权益', 4: '成本', 5: '损益'
    }    
    const subjectBalanceDirectionObj = {
        1: '借', 2: '贷'
    }  
    subjectList.forEach(subject => {
        if (subject.children) {
            subjectList.push(...subject.children);
            subject.children = null;
        }
    })
    subjectList.forEach(subject => {
        if (subject.children) {
            subjectList.push(...subject.children);
            subject.children = null;
        }
    })
    subjectList.forEach(subject => {
        if (subject.children) {
            subjectList.push(...subject.children);
            subject.children = null;
        }
    })
    subjectList.forEach(subject => {
        if (subject.children) {
            subjectList.push(...subject.children);
            subject.children = null;
        }
    })
    subjectList = _.orderBy(subjectList, ['subjectId'], ['asc']);
    let sql = 'INSERT INTO \`subject\` (`subjectId`, `subjectName`, `subjectCategory`, `subjectBalanceDirection`, `remark`) VALUES \n';
    subjectList.forEach(subject => {
        const { number: subjectId, subjectName, type, balanceDirection, ch} = subject;
        const subjectCategory = subjectCategoryObj[type];
        const subjectBalanceDirection = subjectBalanceDirectionObj[balanceDirection];
        const remark = '';
        sql += `('${subjectId}', '${subjectName}', '${subjectCategory}', '${subjectBalanceDirection}', '${remark}'),\n`;
    });    
    sql = sql
        .replace(/\,\n$/, ';')
        .replace(/''/g, 'null');
    fs.writeFileSync(path.join(__dirname, './subject.sql'), sql);
}


(async() => {
    console.log("=======================subject.js start===========================")
    generateSubjectInsertSql();
    console.log("=======================subject.js end=============================")
})()