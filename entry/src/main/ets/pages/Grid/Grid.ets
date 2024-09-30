@Entry({ routeName: "GridPage" })
@Component
struct GridPage {
  componentName = "GridPage"

  //Entry 生命周期
  onPageShow(): void {
    console.log(`${this.componentName} - onPageShow`)
  }

  onPageHide(): void {
    console.log(`${this.componentName} - onPageHide`)
  }

  //Component 生命周期
  aboutToAppear(): void {
    console.log(`${this.componentName} - aboutToAppear`)
  }

  aboutToDisappear(): void {
    console.log(`${this.componentName} - aboutToDisappear`)
  }

  // aboutToReuse(params: { [key: string]: Any }): void {
  // }

  aboutToRecycle(): void {
    console.log(`${this.componentName} - aboutToRecycle`)
  }

  @State bgColors: Color[] =
    [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown]
  @State currentBp: string = 'unknown'

  build() {
    Column() {
      this._grid()
      this._split()
    }.width('80%').margin({ left: 10, top: 5, bottom: 5 }).height(200)
    .border({ color: '#880606', width: 2 })
  }

  @Builder
  _grid() {
    GridRow({
      columns: 5, // 总的列数
      gutter: { x: 5, y: 10 }, // horizontal vertical 方向的间隔
      // breakpoints: { value: ["400vp", "600vp", "800vp"],
      //   reference: BreakpointsReference.WindowSize },
      direction: GridRowDirection.Row
    }) {
      ForEach(this.bgColors, (color: Color, index) => {
        GridCol({
          span: index == 2 ? 3 : 1, // 本列的宽跨度
          offset: index == 1 ? 1 : 0, //距离前一个GridCol的偏移
          order: 0
        }) {
          Row().width("100%").height("20vp")
        }.borderColor(color).borderWidth(2)

        // .gridColOffset(1)
        // .span(2)
        // .order(0)

      })
    }.width("100%").height("100%")
    .onBreakpointChange((breakpoint) => {
      this.currentBp = breakpoint
    })
  }

  // 两兄弟一样的用法
  @Builder
  _split() {
    Text('The secant line can be dragged').fontSize(9).fontColor(0xCCCCCC).width('90%')
    ColumnSplit() {
      Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      Text('2').width('100%').height(50).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
      Text('3').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      Text('4').width('100%').height(50).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
      Text('5').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
    }
    .borderWidth(1)
    // .divider({ // 上下间隔
    //   startMargin: 10,
    //   endMargin: 50,
    // })
    .resizeable(true) // 可拖动

    Text('The second line can be dragged').fontSize(9).fontColor(0xCCCCCC).width('90%')
    RowSplit() {
      Text('1').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      Text('2').width('10%').height(100).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
      Text('3').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      Text('4').width('10%').height(100).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
      Text('5').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
    }
    .resizeable(true) // 可拖动
    .width('90%').height(100)
  }


}
