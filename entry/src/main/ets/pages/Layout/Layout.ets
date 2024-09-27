import { CircleShape, EllipseShape, LengthMetrics, matrix4, PathShape, RectShape, router } from '@kit.ArkUI'

@Entry({ routeName: "LayoutPage" })
@Component
struct LayoutPage {
  componentName = "LayoutPage"

  //Entry 生命周期
  onPageShow(): void {
    console.log(`${this.componentName} - onPageShow`)
  }

  onPageHide(): void {
    console.log(`${this.componentName} - onPageHide`)
  }

  //Component 生命周期
  aboutToAppear(): void {
    let param_from_last_page = router.getParams() as Record<string, string>;
    if (param_from_last_page) {
      let a_param = param_from_last_page["a_param"];
      console.log("console");
    }


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

  @State WidthStartValue: number = 10
  @State WidthEndValue: number = 10
  @State SliceStartValue: number = 10
  @State SliceEndValue: number = 10
  @State OutSetStartValue: number = 0
  @State OutSetEndValue: number = 0
  @State RepeatValue: RepeatMode[] = [RepeatMode.Repeat, RepeatMode.Stretch, RepeatMode.Round, RepeatMode.Space]
  @State SelectIndex: number = 1
  @State SelectText: string = 'Stretch'
  @State FillValue: boolean = false
  @State shColor: Color = Color.White;
  @State sizeDate: number = 20;
  @State rVal: number = 255;
  @State gVal: number = 255;
  @State bVal: number = 255;
  @State aVal: number = 0.1;
  @State rad: number = 40;
  @State satVal: number = 0.8;
  @State briVal: number = 1.5;
  @State progressMask: ProgressMask = new ProgressMask(0, 100, Color.Green)

  build() {
    Scroll() {
      Column({ space: 5 }) {
        RelativeContainer() {
          Text("position").position({ right: 0, top: 20 }).backgroundColor(Color.Blue)

          Text("offset").offset({ x: 10, y: 10 }).backgroundColor(Color.Green)

          Text("markAnchor").markAnchor({ x: 0, y: 20 }).backgroundColor(Color.Red)

        }.width(200).height(100).backgroundColor(Color.Orange)

        RelativeContainer() {
        }
        .width(100)
        .aspectRatio(2)
        .backgroundColor(Color.Green)


        Flex() {
          RelativeContainer()// .width(20).height(20)
            .backgroundColor(Color.Red).flexGrow(1)
          RelativeContainer().backgroundColor(Color.Green).flexGrow(3) // 我的评价是flexGrow不如layoutWeight
        }.backgroundColor(Color.Orange)
        .opacity(0.5)
        .height(50)

        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          // 线段
          Text('dashed')
            .borderStyle(BorderStyle.Dashed)
            .borderWidth(5)
            .borderColor(0xAFEEEE)
            .borderRadius(0)
            .width(120)
            .height(120)
            .textAlign(TextAlign.Center)
            .fontSize(16)
          // 点线
          Text('dotted')
            .border({
              width: 5,
              color: 0x317AF7,
              radius: 10,
              style: BorderStyle.Dotted
            })
            .width(120)
            .height(120)
            .textAlign(TextAlign.Center)
            .fontSize(16)

          Text('.border')
            .fontSize(16)
            .width(150)
            .height(150)
            .border({
              width: {
                left: 3,
                right: 6,
                top: 10,
                bottom: 15
              },
              color: {
                left: '#e3bbbb',
                right: Color.Blue,
                top: Color.Red,
                bottom: Color.Green
              },
              radius: {
                topLeft: 10,
                topRight: 20,
                bottomLeft: 40,
                bottomRight: 80
              },
              style: {
                left: BorderStyle.Dotted,
                right: BorderStyle.Dotted,
                top: BorderStyle.Solid,
                bottom: BorderStyle.Dashed
              }
            })
            .textAlign(TextAlign.Center)
        }.width('100%').height(150)

        // borderImage
        Text('This is gradient color.').textAlign(TextAlign.Center).height(50).width(200)
          .borderImage({
            source: {
              angle: 90,
              direction: GradientDirection.Left,
              colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
            },
            slice: {
              top: 20,
              bottom: 0,
              left: 0,
              right: 20
            },
            width: {
              top: "20px",
              bottom: "20px",
              left: "20px",
              right: "20px"
            }, // 会影响slice的设置
            repeat: RepeatMode.Stretch,
            outset: 10,
            fill: false
          })


        Row({}) {
          Column({ space: 20 }) {
            Row() {
              Text('This is borderImage.').textAlign(TextAlign.Center).fontSize(50)
            }
            .borderImage({
              source: $r('app.media.startIcon'),
              slice: {
                top: LengthMetrics.px(10),
                bottom: LengthMetrics.px(10),
                start: LengthMetrics.px(this.SliceStartValue),
                end: LengthMetrics.px(this.SliceEndValue)
              },
              width: {
                top: LengthMetrics.px(10),
                bottom: LengthMetrics.px(10),
                start: LengthMetrics.px(this.WidthStartValue),
                end: LengthMetrics.px(this.WidthEndValue)
              },
              outset: {
                top: LengthMetrics.px(10),
                bottom: LengthMetrics.px(10),
                start: LengthMetrics.px(this.OutSetStartValue),
                end: LengthMetrics.px(this.OutSetEndValue)
              },
              repeat: this.RepeatValue[this.SelectIndex],
              fill: this.FillValue
            }).backgroundColor(Color.Orange)

            Column() {
              Text(`borderImageSliceStart = ${this.SliceStartValue}px`)
              Slider({
                value: this.SliceStartValue,
                min: 0,
                max: 100,
                style: SliderStyle.OutSet
              })
                .onChange((value: number, mode: SliderChangeMode) => {
                  this.SliceStartValue = value
                })
            }

            Column() {
              Text(`borderImageEndSliceStart = ${this.SliceEndValue}px`)
              Slider({
                value: this.SliceEndValue,
                min: 0,
                max: 100,
                style: SliderStyle.OutSet
              })
                .onChange((value: number, mode: SliderChangeMode) => {
                  this.SliceEndValue = value
                })
            }

            Column() {
              Text(`borderImageWidthStart = ${this.WidthStartValue}px`)
              Slider({
                value: this.WidthStartValue,
                min: 0,
                max: 100,
                style: SliderStyle.OutSet
              })
                .onChange((value: number, mode: SliderChangeMode) => {
                  this.WidthStartValue = value
                })
            }

            Column() {
              Text(`borderImageWidthEnd = ${this.WidthEndValue}px`)
              Slider({
                value: this.WidthEndValue,
                min: 0,
                max: 100,
                style: SliderStyle.OutSet
              })
                .onChange((value: number, mode: SliderChangeMode) => {
                  this.WidthEndValue = value
                })
            }

            Column() {
              Text(`borderImageOutSetStart = ${this.OutSetStartValue}px`)
              Slider({
                value: this.OutSetStartValue,
                min: 0,
                max: 100,
                style: SliderStyle.OutSet
              })
                .onChange((value: number, mode: SliderChangeMode) => {
                  this.OutSetStartValue = value
                })
            }

            Column() {
              Text(`borderImageOutSetEnd = ${this.OutSetEndValue}px`)
              Slider({
                value: this.OutSetEndValue,
                min: 0,
                max: 100,
                style: SliderStyle.OutSet
              })
                .onChange((value: number, mode: SliderChangeMode) => {
                  this.OutSetEndValue = value
                })
            }

            Row() {
              Text('borderImageRepeat: ')
              Select([{ value: 'Repeat' }, { value: 'Stretch' }, { value: 'Round' }, { value: 'Space' }])
                .value(this.SelectText)
                .selected(this.SelectIndex)
                .onSelect((index: number, value?: string) => {
                  this.SelectIndex = index
                  this.SelectText = value as string
                })
            }

            Row() {
              Text(`borderImageFill: ${this.FillValue} `)
              Toggle({ type: ToggleType.Switch, isOn: this.FillValue })
                .onChange((isOn: boolean) => {
                  this.FillValue = isOn
                })
            }

          }
          .width('100%')
        }
        .height('100%')
        .padding({ left: 15, right: 15 })


        RelativeContainer() {

          //.align(Alignment.Center)
        }
        .align(Alignment.Center)
        .width(100)
        .height(100)
        .backgroundColor(Color.Orange)
        // .backgroundImage($r('app.media.background'), ImageRepeat.NoRepeat)
        // .backgroundImageSize(ImageSize.FILL)
        .background()

        // .foregroundBlurStyle(BlurStyle.Regular)
        // .backgroundBlurStyle(BlurStyle.Regular)
        // .backdropBlur()
        Stack() {
          Image($r('app.media.saber'))
          Column() {
            Column({ space: 0 }) {
              Column() {
                Text('11')
                  .fontSize(100)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('rgba(255,255,255,1)')
                  .fontFamily('HarmonyOS-Sans-Digit')
                  .maxLines(1)
                // .lineHeight(120 * 1.25)
                // .height(100)
                // .backgroundColor(Color.Green)
                Text('42')
                  .fontSize(100)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('rgba(255,255,255,1)')
                  .fontFamily('HarmonyOS-Sans-Digit')
                  .maxLines(1)
                // .lineHeight(120 * 1.25)
                // .height(100)
                // .letterSpacing(4 * 1.25)
                // .shadow({
                //   color: 'rgba(0,0,0,0)',
                //   radius: 20,
                //   offsetX: 0,
                //   offsetY: 0
                // })
                // .backgroundColor(Color.Green)
                Row() {
                  Text('10月16日')
                    .fontSize(this.sizeDate)
                    .height(22)
                    .fontWeight('medium')
                    .fontColor('rgba(255,255,255,1)')
                  Text('星期一')
                    .fontSize(this.sizeDate)
                    .height(22)
                    .fontWeight('medium')
                    .fontColor('rgba(255,255,255,1)')
                }
              }
              .blendMode(BlendMode.DST_IN, BlendApplyType.OFFSCREEN) // 将当前控件的内容（包含子节点内容）与下方画布（可能为离屏画布）已有内容进行混合。
              //DST_IN：    r = d * sa，只显示目标像素中与源像素重叠的部分。
              // .pixelRound({
              //   start: PixelRoundCalcPolicy.FORCE_FLOOR ,
              //   top: PixelRoundCalcPolicy.FORCE_FLOOR ,
              //   end: PixelRoundCalcPolicy.FORCE_CEIL,
              //   bottom: PixelRoundCalcPolicy.FORCE_CEIL
              // })
            }
            .blendMode(BlendMode.SRC_OVER, BlendApplyType.OFFSCREEN)
            //SRC_OVER：   r = s + (1 - sa) * d，将源像素按照透明度进行混合，覆盖在目标像素上。
            .backgroundEffect({
              radius: this.rad,
              saturation: this.satVal,
              brightness: this.briVal,
              color: this.getVolumeDialogWindowColor()
            })
            .justifyContent(FlexAlign.Center)

            // .pixelRound({
            //   start: PixelRoundCalcPolicy.FORCE_FLOOR ,
            //   top: PixelRoundCalcPolicy.FORCE_FLOOR ,
            //   end: PixelRoundCalcPolicy.FORCE_CEIL,
            //   bottom: PixelRoundCalcPolicy.FORCE_CEIL
            // })
          }
        }
        .backgroundColor(Color.Orange)

        // .overlay("Winter is a beautiful season, especially when it snows.", {
        //   align: Alignment.Bottom,
        //   offset: { x: 0, y: -15 }
        // })
        // .overlay(this.OverlayNode(), { align: Alignment.BottomStart , offset: {x: 0, y: -10}})
        // .objectFit(ImageFit.Contain)


        Text('Matrix4').width('90%').fontColor(0xCCCCCC).padding(15).fontSize(14)
        Row()
          .width(100).height(100).backgroundColor(0xAFEEEE)
          .transform(
            matrix4.identity()
              .translate({ x: 50, y: 50 })
              .scale({ x: 0.5, y: 1 })
              .rotate({
                x: 0,
                y: 0,
                z: 1,
                angle: 45
              })
          )

        Row() {
          Row() {
            Row()
              .backgroundColor(Color.Black)
              .width(100)
              .height(100)
              .opacity(1)
          }
          .backgroundColor(Color.White)
          .width(150)
          .height(150)
          .justifyContent(FlexAlign.Center)
          .opacity(0.6)
          .renderGroup(true) //设置当前控件和子控件是否先整体离屏渲染绘制后再与父控件融合绘制。 opacity的影响
        }
        .backgroundColor(Color.Black)
        .width(200)
        .height(200)
        .justifyContent(FlexAlign.Center)
        .opacity(1)


        Column() {
          Text("blendMode")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor('#ffff0101')
          Row() {
            Circle()
              .width(200)
              .height(200)
              .fill(Color.Green)
              .position({ x: 50, y: 50 })
            Circle()
              .width(200)
              .height(200)
              .fill(Color.Blue)
              .position({ x: 150, y: 50 })
          }
          .blendMode(BlendMode.OVERLAY, BlendApplyType.OFFSCREEN)
          .alignItems(VerticalAlign.Center)
          .height(300)
          .width('100%')
        }
        .height('50%')
        .width('100%')
        .backgroundImage($r('app.media.saber'))
        .backgroundImageSize(ImageSize.Cover)

        Text('This is the text content with letterSpacing 0.')
          .letterSpacing(0)
          .fontSize(12)
          .border({ width: 1, color: Color.Orange })
          .padding(10)
          .clip(false)
          .width('50%')
          .pixelStretchEffect({
            top: 10,
            left: 10,
            right: 10,
            bottom: 10
          }) // 扩展边沿像素
        Rect()
          .radius(10)
          .width(100)
          .height(200)
          .fill(Color.Pink)
          .stroke(Color.Red)
          .strokeWidth(2)


        RelativeContainer() {

        }
        .width(100)
        .height(100)
        .backgroundColor(Color.Orange)
        // .clipShape(
        //   // new CircleShape({width: 100, height: 100})
        //   //new EllipseShape
        //   //new PathShape({commands: undefined}) //FIXME: 需要去了解下
        //   new RectShape({
        //     // radiusWidth: 20,
        //     // radiusHeight: 5,
        //     // radius: 19
        //   }).width(100).height(100)
        // )
        .maskShape(new RectShape({
          // radiusWidth: 20,
          // radiusHeight: 5,
          radius: 19
        })
          .width(100)
          .height(100)
        )
        .mask(
          this.progressMask // 很奇怪的遮罩效果
        )


        Slider({
          // value: this.progressmask.,
          min: 0,
          max: 100,
          style: SliderStyle.OutSet
        })
          .onChange((value: number, mode: SliderChangeMode) => {
            this.progressMask.updateProgress(value)
          })
          .padding({ left: 15, right: 15 })
        //FIXME:


        RelativeContainer() {

        }
        .width(100)
        .height(100)
        .linearGradient(
          {
            colors: [[Color.Pink, 0.3], [Color.Orange, 0.6], [Color.Blue, 1]]
          }
        )
        // .sweepGradient(
        //   {
        //     center: [50, 50],
        //     start: 0,
        //     // end: 360,
        //     end: 180,
        //     // rotation: 45, // 旋转角度
        //     // repeating: true, // 渐变颜色是否重复
        //     colors: [[0xff0000, 0.0], [0x0000ff, 0.3], [0xffff00, 0.5], [Color.Green, 1]] // 数组末尾元素占比小于1时满足重复着色效果
        //   }
        // )
        .radialGradient(
          {
            center: [50, 50],
            radius: 60,
            // repeating: true,
            colors: [[0xff0000, 0.0], [0x0000ff, 0.33], [0xffff00, 0.66], [Color.Green, 1]] // 数组末尾元素占比小于1时满足重复着色效果
          }
        )
        .backgroundColor(Color.Orange)
      }
    }
  }

  @Builder
  OverlayNode() {
    Column() {
      Image($r('app.media.dlam')).layoutWeight(1).height(100)// .renderMode(ImageRenderMode.Template)
        .objectFit(ImageFit.Contain)
      Text("This is overlayNode").fontSize(20).fontColor(Color.White)
    }
    .clip(true)

    //.alignItems(HorizontalAlign.Center).width('100%').height('100%')
  }

  getVolumeDialogWindowColor(): ResourceColor | string {
    return `rgba(${this.rVal.toFixed(0)}, ${this.gVal.toFixed(0)}, ${this.bVal.toFixed(0)}, ${this.aVal.toFixed(0)})`;
  }
}
